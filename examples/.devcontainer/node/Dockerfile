# Declare build-time arguments
ARG IMAGE_TAG
ARG NVM_VERSION
ARG NODE_VERSION
ARG YARN_VERSION

# Use a Debian-based image version (e.g. bullseye, bookworm)
FROM debian:${IMAGE_TAG}

# Re-declare build-time args (needed to propagate values)
ARG NVM_VERSION
ARG NODE_VERSION
ARG YARN_VERSION

# Define environment variables
ENV NVM_VERSION=${NVM_VERSION}
ENV NODE_VERSION=${NODE_VERSION}
ENV YARN_VERSION=${YARN_VERSION}
ENV NVM_DIR=/home/node/.nvm

# Prevent interactive prompts during build
ENV DEBIAN_FRONTEND=noninteractive

# Install required system packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    bash \
    build-essential \
    ca-certificates \
    curl \
    docker.io \
    git \
    nano \
    openssh-client \
    sqlite3 \
    tzdata \
    zsh && \
    rm -rf /var/lib/apt/lists/* && apt-get clean

# Install CLI tools: ripgrep (rg), fd, bat, fzf
RUN apt-get update && \
    apt-get install -y ripgrep bat fd-find && \
    rm -rf /var/lib/apt/lists/* && apt-get clean && \
    ln -s /usr/bin/batcat /usr/local/bin/bat && \
    ln -s $(which fdfind) /usr/local/bin/fd

# Set timezone
RUN ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && \
    echo "America/Sao_Paulo" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata

# Create a non-root user with UID 1000
ARG DOCKER_GID=1001

# Ensure group 'docker' has correct GID and user 'node' is in it
RUN if getent group docker > /dev/null; then \
        groupmod -g ${DOCKER_GID} docker; \
    else \
        groupadd -g ${DOCKER_GID} docker; \
    fi && \
    useradd -ms /bin/zsh -u 1000 -G docker node

# Switch to non-root user
USER node

# Install NVM
RUN bash -c "\
    mkdir -p \$NVM_DIR && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v\$NVM_VERSION/install.sh | bash \
"

# Install Yarn using official install script
RUN . $NVM_DIR/nvm.sh && curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version $YARN_VERSION

# Install Oh My Zsh
RUN ZSH=~/.zsh sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Copy custom Zsh config and shell folder
COPY --chown=node:node .zshrc .p10k.zsh /home/node/
COPY --chown=node:node .config_shell /home/node/.config_shell/
COPY --chown=node:node .histdb /home/node/.histdb/

# Install Powerlevel10k theme and Zsh plugins
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.zsh/custom}/themes/powerlevel10k && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.zsh/custom}/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.zsh/custom}/plugins/zsh-syntax-highlighting && \
    git clone https://github.com/lgdevlop/zsh-smart-insert.git ${ZSH_CUSTOM:-~/.zsh/custom}/plugins/zsh-smart-insert && \
    git clone https://github.com/larkery/zsh-histdb.git ${ZSH_CUSTOM:-~/.zsh/custom}/plugins/zsh-histdb && \
    git clone https://github.com/lgdevlop/zsh-ai-complete.git ${ZSH_CUSTOM:-~/.zsh/custom}/plugins/zsh-ai-complete

# Install fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
    ~/.fzf/install --key-bindings --completion --no-update-rc

# Back to root for final image extensions if needed
USER root

# Default shell when container starts
CMD ["zsh"]
