# Declare build-time arguments
ARG IMAGE_TAG
ARG NVM_VERSION
ARG NODE_VERSION
ARG YARN_VERSION
ARG JAVA_VERSION
ARG MAVEN_VERSION

# Use a Debian-based image version (e.g. bullseye, bookworm)
FROM debian:${IMAGE_TAG}

# Re-declare build-time arguments
ARG NVM_VERSION
ARG NODE_VERSION
ARG YARN_VERSION
ARG JAVA_VERSION
ARG MAVEN_VERSION

# Define environment variables
ENV NVM_VERSION=${NVM_VERSION}
ENV NODE_VERSION=${NODE_VERSION}
ENV YARN_VERSION=${YARN_VERSION}
ENV JAVA_VERSION=${JAVA_VERSION}
ENV MAVEN_VERSION=${MAVEN_VERSION}
ENV NVM_DIR=/home/node/.nvm
ENV DEBIAN_FRONTEND=noninteractive

# Install required system packages including OpenJDK
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    bash \
    build-essential \
    ca-certificates \
    curl \
    docker.io \
    git \
    gnupg \
    nano \
    openjdk-${JAVA_VERSION}-jdk \
    openssh-client \
    sqlite3 \
    tzdata \
    unzip \
    wget \
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

# Install NVM and Node.js
RUN bash -c "\
  mkdir -p \$NVM_DIR && \
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v\$NVM_VERSION/install.sh | bash \
"

# Install Yarn using the official script
RUN . $NVM_DIR/nvm.sh && \
    curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version $YARN_VERSION

# Install Maven manually
RUN mkdir -p /home/node/.maven && \
    cd /home/node/.maven && \
    curl -fsSL https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz -o maven.tar.gz && \
    tar -xzf maven.tar.gz && \
    rm maven.tar.gz && \
    ln -s /home/node/.maven/apache-maven-${MAVEN_VERSION} /home/node/.maven/default && \
    echo 'export MAVEN_HOME=/home/node/.maven/default' >> ~/.zshrc && \
    echo 'export PATH=$MAVEN_HOME/bin:$PATH' >> ~/.zshrc

# Install Oh My Zsh
RUN ZSH=~/.zsh sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Copy custom Zsh configuration files and shell config folder
COPY --chown=node:node .zshrc .p10k.zsh /home/node/
COPY --chown=node:node .config_shell /home/node/.config_shell/
COPY --chown=node:node .histdb /home/node/.histdb/

# Configure JAVA_HOME for the node user
RUN echo "export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which javac))))" >> ~/.config_shell/.sh_paths && \
    echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.config_shell/.sh_paths && echo ""

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

# Return to root for optional extensions
USER root

# Default shell when container is launched
CMD ["zsh"]
