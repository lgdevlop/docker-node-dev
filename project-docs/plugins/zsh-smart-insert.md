# Zsh Smart Insert Plugin Documentation

## Overview

`zsh-smart-insert` is a custom Zsh plugin that enhances developer productivity by enabling intelligent insertion of files and content directly into the shell. It leverages the fuzzy-finder tool FZF and preview enhancements with `bat`, as well as smart search capabilities using tools like `fd` and `rg`.

## Key Features

* 📁 Search and insert files by name using `fd`
* 📄 Search and insert file content using `rg`
* 🖥️ Live previews of files with `bat`
* ⌨️ FZF-based interactive UI
* ⚙️ Prefix-based smart behavior to determine context (e.g. file path vs content)

## Configuration and Setup

### Requirements

* [fzf](https://github.com/junegunn/fzf)
* [bat](https://github.com/sharkdp/bat)
* [fd](https://github.com/sharkdp/fd)
* [ripgrep (rg)](https://github.com/BurntSushi/ripgrep)

These tools must be available in your `$PATH`. The Dockerfiles included in this repository already install and alias `bat` and `fd` accordingly:

```bash
ln -s /usr/bin/batcat /usr/local/bin/bat
ln -s $(which fdfind) /usr/local/bin/fd
```

### Plugin Installation

```bash
git clone https://github.com/lgdevlop/zsh-smart-insert.git ${ZSH_CUSTOM:-~/.zsh/custom}/plugins/zsh-smart-insert
```

Enable it by adding it to your `.zshrc` plugin list:

```zsh
plugins=(... zsh-smart-insert)
```

## How It Works

### Prefix Commands

The plugin defines widgets bound to specific key combinations (e.g. `Ctrl+U`) that invoke `fzf` with a smart context:

* **Insert by file name**: Filters files and inserts the full path.
* **Insert by content match**: Searches content and inserts the file path and optionally the line.

### Preview Integration

Uses `bat` as the default previewer:

```bash
--preview 'bat --style=numbers --color=always {}'
```

### FZF Bindings

```bash
--bind 'ctrl-/:change-preview-window(down|hidden|)'
```

## Example Usage

* Press `Ctrl+U` to trigger smart insert.
* Start typing a file name or content string.
* Use arrows or fuzzy search to locate the file.
* Preview appears in a split window using `bat`.
* Press Enter to insert the selected result.

## Developer Notes

The plugin is customizable. You can change the prefix behavior or extend it to support other insertion patterns, such as Markdown snippets or code blocks.

## Credits

Developed by [@lgdevlop](https://github.com/lgdevlop), inspired by terminal AI workflows and developer productivity needs.

---

For full setup instructions and usage examples, see the [main README](https://github.com/lgdevlop/zsh-smart-insert/).
