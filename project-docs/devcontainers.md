# DevContainers Structure

This project provides two DevContainer configurations to support development workflows based on Node.js or Node.js + Java environments.

## Available Configurations

* **Node**

  * Location: `examples/.devcontainer/node/`
  * Base: Debian (bullseye)
  * Includes: Node.js, Yarn, Zsh, Oh My Zsh, fzf, fd, bat, SQLite, Git, Docker client

* **Node + Java**

  * Location: `examples/.devcontainer/node-java/`
  * Base: Debian (bullseye)
  * Includes: All Node stack above **plus** OpenJDK, Maven

## Common Features

* `Oh My Zsh` with plugins:

  * `powerlevel10k`
  * `zsh-autosuggestions`
  * `zsh-syntax-highlighting`
  * `zsh-ai-complete`
  * `zsh-smart-insert`
  * `zsh-histdb`
* Pre-installed CLI tools:

  * `fd`, `rg (ripgrep)`, `bat`, `fzf`, `sqlite3`, `nano`, `git`
* Structured shell configuration:

  * Path: `.config_shell/`
  * Files:

    * `.sh_paths`
    * `.sh_aliases`
    * `.sh_functions`

## DevContainer Features

* Preconfigured Visual Studio Code settings:

  * Default terminal: Zsh
  * Installed extensions (Node): Prettier, ESLint, Docker
  * Installed extensions (Node + Java): Prettier, ESLint, Docker, Java Pack, RedHat Java
* Docker socket and SSH agent forwarding support
* User `node` with UID 1000 and Docker group access (configurable via `DOCKER_GID`)

## Usage

To start using a DevContainer:

1. Open VS Code
2. Run: `Remote-Containers: Open Folder in Container...`
3. Select one of the folders:

   * `examples/.devcontainer/node/`
   * `examples/.devcontainer/node-java/`

Ensure Docker is running and SSH agent forwarding is correctly set up if needed.

---

For custom setups, you can edit the build arguments in each `devcontainer.json` or extend the Dockerfiles as needed.
