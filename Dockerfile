# Use a minimal Ubuntu base image
FROM ubuntu:latest

# Set the working directory
WORKDIR /app

COPY entrypoint.sh /ai/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /ai/entrypoint.sh

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

# Set the entrypoint script as the default command to run when the container starts
CMD ["/app/entrypoint.sh"]
