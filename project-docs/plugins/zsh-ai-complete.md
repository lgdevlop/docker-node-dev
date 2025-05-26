# Zsh Plugin: zsh-ai-complete

## Overview

`zsh-ai-complete` is a custom Zsh plugin that integrates AI-powered command completion into the terminal, using generative APIs to suggest full commands based on the user's query. It enhances productivity by leveraging external AI models (e.g., OpenAI, Ollama, Grok, Gemini) to interpret natural language prompts and return optimized Zsh commands.

## Purpose

The plugin provides intelligent completions and suggestions using AI models. It's ideal for:

* Quickly generating complex shell commands.
* Exploring new CLI tools or options.
* Saving time during repetitive tasks.
* Leveraging multiple AI providers with unified configuration.

## Installation

```sh
# Clone the plugin to the custom plugins folder
git clone https://github.com/lgdevlop/zsh-ai-complete.git ${ZSH_CUSTOM:-~/.zsh/custom}/plugins/zsh-ai-complete

# Add the plugin to the plugins list in .zshrc
plugins=(... zsh-ai-complete)
```

## Configuration

The plugin supports multiple AI providers and settings via a JSON configuration file. Example:

```json
{
  "default": "openai",
  "providers": {
    "openai": {
      "token": "sk-xxx",
      "model": "gpt-4",
      "system_message": "Respond with five Zsh commands without any explanation."
    },
    "ollama": {
      "model": "qwen2.5-coder:7b",
      "system_message": "Respond with five Zsh commands."
    }
  }
}
```

The file can be saved as:

```sh
$HOME/.config/zsh-ai-complete/ai-providers.json
```

## Features

### 🔁 Multiple Provider Support

Switch between providers dynamically inside the FZF UI using shortcuts.

### 💾 Configuration Persistence

All selected models, tokens, and system prompts are saved for reuse.

### 🧠 Intelligent Prompt Handling

Rephrases user prompts before sending to AI APIs to improve relevance and context.

### 🔍 Fast Search with FZF

User input is sent through an interactive FZF widget which displays AI responses.

### 🎨 Highlighted Output

The suggested Zsh commands are colorized and formatted for better readability.

## Workflow

1. Press the shortcut (e.g., Ctrl+U).
2. Enter a prompt (e.g., "List running Docker containers using filters").
3. Plugin queries the configured AI provider.
4. FZF shows the response with command suggestions.
5. Select one to insert directly into the terminal.

## Integration

The plugin is designed to work seamlessly with:

* `zsh-smart-insert` for intelligent file previews.
* `fzf`, `fd`, `bat`, and `rg` for fast and intuitive filtering.

## Credits

Developed by [@lgdevlop](https://github.com/lgdevlop), inspired by terminal AI workflows and developer productivity needs.

---

For full setup instructions and usage examples, see the [main README](https://github.com/lgdevlop/zsh-ai-complete/).
