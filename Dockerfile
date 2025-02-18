# Use Ubuntu as base image
FROM ubuntu:latest

# Avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    nmap \
    wget \
    ca-certificates && \
    mkdir -p /app && \
    useradd -m -d /app scanner && \
    chown -R scanner:scanner /app && \
    chmod -R 550 /app && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy application files
COPY . .

# Create and activate virtual environment, install dependencies
RUN python3 -m venv /app/venv && \
    /app/venv/bin/pip install --no-cache-dir -r requirements.txt && \
    chown -R scanner:scanner /app

# Switch to non-root user
USER scanner

# Expose port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:8080/ || exit 1

# Command to run the application
CMD ["/app/venv/bin/python3", "app.py"]
