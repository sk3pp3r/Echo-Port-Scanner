# Use multi-stage build for smaller final image
FROM alpine:3.19 AS builder

# Install build dependencies
RUN apk add --no-cache \
    python3 \
    py3-pip

# Create and set working directory
WORKDIR /app

# Copy requirements first to leverage Docker cache
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Second stage
FROM alpine:3.19

# Install runtime dependencies
RUN apk add --no-cache \
    python3 \
    nmap \
    ca-certificates \
    && adduser -D -H -h /app scanner \
    && chown -R scanner:scanner /app \
    && chmod -R 550 /app  # More restrictive permissions

# Copy Python packages from builder
COPY --from=builder /usr/lib/python3.11/site-packages/ /usr/lib/python3.11/site-packages/

# Set working directory
WORKDIR /app

# Copy application files
COPY . .

# Set proper permissions
RUN chown -R scanner:scanner /app

# Switch to non-root user
USER scanner

# Expose port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:8085/ || exit 1

# Command to run the application
CMD ["python3", "app.py"]
