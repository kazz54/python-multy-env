# Use a minimal Ubuntu base image
FROM ubuntu:latest

# Set the working directory
WORKDIR /app

# Install supervisor
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        supervisor \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the supervisord configuration file
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Install basic dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        software-properties-common \
        apt-transport-https \
        ca-certificates \
        wget \
        curl \
        python3-pip \
        python3-venv \
        python3-dev \
        lsb-release \
        git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the rest of your application code
COPY . /app/

# Start supervisord to manage processes
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
