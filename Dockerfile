# Use Debian as base image
FROM debian

# Install Samba
RUN apt-get update && \
    apt-get install -y samba && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV TZ=EST5EDT

# Expose necessary ports
EXPOSE 137/udp 138/udp 139/tcp 445/tcp

# Mount volumes
VOLUME ["/mnt", "/mnt2"]

# Set command to run Samba
CMD ["smbd", "--foreground", "--log-stdout", "--no-process-group"]
