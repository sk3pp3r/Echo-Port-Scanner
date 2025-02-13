#!/bin/bash

# Generate a random secret key
SECRET_KEY=$(openssl rand -hex 32)

# Create .env file with the secret key
echo "FLASK_SECRET_KEY=$SECRET_KEY" > .env

# Build and start the containers
docker-compose up -d --build

# Show the logs
docker-compose logs -f 