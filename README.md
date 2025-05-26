# 🧱 DevContainers Overview

This project provides a set of preconfigured DevContainers tailored for Node.js and Node.js + Java development environments. These containers are designed to offer a streamlined developer experience with preinstalled tools, custom Zsh configurations, and enhanced CLI utilities.

## 📁 Structure

```bash
examples/.devcontainer/
├── .config_shell/       # Custom shell configuration (aliases, paths, functions)
├── .histdb/             # Prebuilt Zsh history database
├── .zshrc               # Main Zsh configuration
├── .p10k.zsh            # Powerlevel10k prompt configuration
├── node/                # DevContainer for Node.js
│   ├── devcontainer.json
│   └── Dockerfile
└── node-java/           # DevContainer for Node.js + Java + Maven
    ├── devcontainer.json
    └── Dockerfile
```

## 🔧 Features

* 🌧️ Based on Debian (e.g., `bullseye`)
* 🧑‍💻 User `node` (UID 1000) with proper Docker group access
* 🧹 Includes:

  * Node.js + Yarn (via NVM)
  * Optional: OpenJDK (Java 17) and Maven (3.9.6)
  * Oh My Zsh + Powerlevel10k theme
  * Plugins: `zsh-ai-complete`, `zsh-smart-insert`, autosuggestions, syntax highlighting, histdb
  * CLI tools: `fd`, `bat`, `ripgrep`, `fzf`

## 📦 Docker Images via GitHub Actions

This repository includes a workflow to build and publish Docker images to Docker Hub. These images are suitable for direct usage in DevContainers and Codespaces, avoiding the need to customize Dockerfiles locally.

### 🔁 Manual Build Trigger

You can trigger the workflow manually from the GitHub Actions tab using the following input options:

| Input           | Description                       | Example          |
| --------------- | --------------------------------- | ---------------- |
| `image_tag`     | Debian base tag                   | `bullseye`       |
| `node_version`  | Node.js version to install        | `22.1.0`         |
| `include_java`  | Whether to include Java and Maven | `true` / `false` |
| `java_version`  | OpenJDK version                   | `17`             |
| `maven_version` | Maven version                     | `3.9.6`          |
| `nvm_version`   | NVM version                       | `0.39.7`         |
| `yarn_version`  | Yarn version                      | `1.22.22`        |
| `docker_gid`    | GID for the Docker group          | `1001`           |
| `update_latest` | Also tag the image as `latest`    | `true` / `false` |
| `use_cache`     | Enable Docker layer cache         | `true` / `false` |

> 🔐 Note: Only the repository owner (`lgdevlop`) is authorized to trigger the build.

**🧰 Docker Hub**
Published images are available at:
👉 [`https://hub.docker.com/r/lgdevlop/node-dev`](https://hub.docker.com/r/lgdevlop/node-dev)

## 💡 Usage

Use the `devcontainer.json` configuration in VS Code Remote Containers or GitHub Codespaces. You can choose between:

* `node/` for pure JavaScript/TypeScript projects
* `node-java/` for full-stack projects that require Java and Maven

## 📌 Notes

* SSH agent forwarding is configured via mounts.
* Docker socket is mounted for inner Docker access.
* History is tracked using `zsh-histdb` and enhanced with autosuggestions.

## 📚 Documentation

Full documentation is located in [`project-docs/`](./project-docs/):

* [`devcontainers.md`](./project-docs/devcontainers.md)
* [`zsh-config.md`](./project-docs/zsh-config.md)
* [`plugins/zsh-histdb.md`](./project-docs/plugins/zsh-histdb.md)
* [`plugins/zsh-smart-insert.md`](./project-docs/plugins/zsh-smart-insert.md)
* [`plugins/zsh-ai-complete.md`](./project-docs/plugins/zsh-ai-complete.md)

## 🚀 Author

Created by [Leonardo Gomes](https://github.com/lgdevlop) — Simplifying CLI and container workflows.
