# Use a minimal Ubuntu base image
FROM ubuntu:latest

# Set the working directory
WORKDIR /app

COPY entrypoint.sh /app/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /app/entrypoint.sh

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
        supervisor \
        lsb-release \
        git

# Copy the rest of your application code
COPY . /app/

# Start an interactive bash shell
CMD ["/bin/bash"]
