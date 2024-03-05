# Use a minimal Ubuntu base image
FROM ubuntu:latest

# Set the working directory
WORKDIR /app

# Update package repositories
RUN apt-get update

# Set noninteractive mode to prevent prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install supervisor and basic dependencies
RUN apt-get install -y --no-install-recommends \
        supervisor \
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
        make \
        build-essential \
        libssl-dev \
        zlib1g-dev \
        libbz2-dev \
        libreadline-dev \
        libsqlite3-dev \
        llvm \
        libncurses5-dev \
        libncursesw5-dev \
        xz-utils \
        tk-dev \
        libffi-dev \
        liblzma-dev

# Install pyenv
ENV PYENV_ROOT /opt/pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
RUN curl https://pyenv.run | bash \
    && echo 'eval "$(pyenv init --path)"' >> ~/.bashrc

# Install Python 3.10 and set it as the default version
RUN pyenv install 3.10.0 \
    && pyenv global 3.10.0

# Copy the supervisord configuration file
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Copy the rest of your application code
COPY . /app/

# Start supervisord to manage processes
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
