# Zsh Configuration Overview

This document provides a structured overview of the Zsh configuration used in the DevContainers. It includes explanations of the `.zshrc` file, the modular shell configuration in `.config_shell/`, and the plugins and tools integrated into the environment.

---

## .zshrc File

The `.zshrc` file serves as the main entry point for the Zsh shell configuration. It performs the following actions:

* Enables the Powerlevel10k instant prompt if available.
* Loads custom configuration files from `.config_shell/`:

  * `.sh_paths`: Path declarations
  * `.sh_aliases`: Custom aliases
  * `.sh_functions`: Utility functions
* Sets the `powerlevel10k` theme and disables the configuration wizard.
* Loads essential plugins:

  ```zsh
  plugins=(
    docker
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    fzf
    zsh-ai-complete
    zsh-smart-insert
  )
  ```

* Configures FZF with fd, bat, and custom preview and key bindings.
* Loads the Oh My Zsh framework.
* Loads zsh-histdb plugin and related interactive search features.
* Initializes NVM and sets up automatic `nvm use` based on `.nvmrc`.
* Sets the autosuggestion strategy to use `zsh-histdb`.

---

## .config\_shell/

This directory contains modular configuration scripts to keep the `.zshrc` file clean and organized.

### .sh\_paths

Responsible for exporting and extending important environment variables:

* Adds custom directories to `$PATH`:
  * `$HOME/bin`
  * `/usr/local/bin`
  * `$HOME/.yarn/bin/`
  * `$HOME/.local/bin`
* Sets `$ZSH` to `~/.zsh`
* Defines `JAVA_HOME` based on `javac` binary
* Defines `MAVEN_HOME` and appends it to the `$PATH`
* Adds fzf binary path (`$HOME/.fzf/bin`) to the environment

### .sh\_aliases

Currently serves as a placeholder for user-defined aliases. It's pre-structured for future extensibility.

### .sh\_functions

Defines utility functions and custom strategies for `zsh-histdb` integration:

#### HistDB Suggestion Strategies

* `histdb_top_here`: Suggests the most used command in the current directory
* `histdb_top`: Suggests the most used command overall
* `histdb_top_fallback`: Fallback strategy based on history across locations

#### History Helpers

* `show_local_history(limit)`: Lists recent commands used in the current directory
* `search_local_history(query)`: Greps history locally using a keyword
* `find_command_history(query)`: Searches command history globally

#### Miscellaneous Helpers

* `extract_release_version()`: Extracts version numbers from strings
* `has_program(name)`: Checks if a given binary is available in the system

---

## Plugin Integration

The `.zshrc` and `.config_shell/` setup work in tandem with:

* **Powerlevel10k**: High-performance theme
* **Oh My Zsh**: Plugin manager and framework
* **fzf**: Fuzzy finder with keyboard bindings and preview
* **zsh-histdb**: Advanced history database and autosuggestion support
* **zsh-smart-insert**: Smart file insertion with preview
* **zsh-ai-complete**: AI-assisted Zsh command completion

---

## Summary

This modular shell configuration is designed for maximum clarity, extensibility, and performance in terminal workflows. It supports advanced history search, smart suggestions, AI completions, and a modern prompt UI.
