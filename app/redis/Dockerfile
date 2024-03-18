FROM redis

# Create directory and set ownership it works
RUN mkdir /opt/redis && chown redis:redis /opt/redis

# Set the working directory test
WORKDIR /opt/redis

# Adjust permissions for the working directory
RUN chmod 770 /opt/redis

# Adjust permissions for the /app/redis directory
RUN chmod 770 /app/redis
