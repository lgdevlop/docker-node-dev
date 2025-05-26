# zsh-histdb Plugin

## Purpose

The `zsh-histdb` plugin provides advanced shell history management by storing Zsh command history in a SQLite database. This enables enhanced querying, sorting, and pattern-based history recall, far beyond the default `.zsh_history` capabilities.

## Installation

The plugin is installed using Git during the Docker build process:

```bash
# Installed into the custom plugins folder
$ git clone https://github.com/larkery/zsh-histdb.git ${ZSH_CUSTOM:-~/.zsh/custom}/plugins/zsh-histdb
```

Additionally, the following two scripts are sourced in `.zshrc`:

```zsh
source $ZSH/custom/plugins/zsh-histdb/sqlite-history.zsh
source $ZSH/custom/plugins/zsh-histdb/histdb-interactive.zsh
```

## Integration with Autosuggestions

To enable context-aware autosuggestions based on historical frequency and location, the following custom strategies are defined in `.sh_functions`:

### `_zsh_autosuggest_strategy_histdb_top_here`

Returns the most frequent command used in the **current directory or below** that matches the user's input.

### `_zsh_autosuggest_strategy_histdb_top`

Returns the most frequent command used **globally**, sorted by frequency but giving preference to the current directory.

### `_zsh_autosuggest_strategy_histdb_top_fallback`

Fallback strategy that prioritizes local history if matches exist; otherwise, defaults to global history.

These strategies are compatible with `zsh-autosuggestions` when the variable is configured:

```zsh
ZSH_AUTOSUGGEST_STRATEGY=histdb_top_here
```

## Interactive Search

The plugin includes an interactive search interface, accessible via the `histdb-interactive.zsh` script. This allows fuzzy searching through history with context.

## Supporting Functions

Custom helper functions provided in `.sh_functions` include:

### `show_local_history [limit]`

Displays the most recent commands used in the current directory.

### `search_local_history <pattern>`

Searches for a pattern in the local directory’s command history.

### `find_command_history <prefix> [limit]`

Returns globally used commands matching a prefix, ordered by recency.

## Data Persistence

History is stored in `~/.histdb/zsh-history.db`, which is mounted in the DevContainer and versioned in this example for educational purposes.

---

By combining `zsh-histdb` with autosuggestions and custom strategies, this project enables a more intelligent, context-aware shell experience. This plugin is particularly valuable for workflows involving frequent command reuse or project-specific history navigation.
