# 🔐 SSH Agent Setup for Host Integration

To enable seamless Git operations from inside your DevContainer (like cloning private repositories or using signed commits), SSH agent forwarding must be correctly set up on your host machine.

This guide helps you configure a persistent SSH agent with a fixed socket path on the host side, so it can be mounted into the DevContainer.

## 💡 Why This Is Needed

DevContainers mount your host’s SSH agent socket. However, depending on your shell session and OS, the socket path (`SSH_AUTH_SOCK`) may change every time you open a new terminal.

This script ensures a consistent socket path and automatically loads your SSH keys, allowing DevContainers to forward your SSH identity properly.

## 🧹 How to Configure

Add the following snippet to your **host machine's** shell config file (either `~/.zshrc` or `~/.bashrc`):

```bash
# 🔐 Start ssh-agent with fixed socket and load keys
export SSH_AUTH_SOCK="$HOME/.ssh/agent-socket"

# Check if agent is running and socket is valid
if ! ssh-add -l >/dev/null 2>&1; then
  echo "🔄 Restarting ssh-agent..."

  # Kill previous agent (if any)
  fuser -k "$SSH_AUTH_SOCK" >/dev/null 2>&1
  rm -f "$SSH_AUTH_SOCK"

  # Start new agent using fixed socket path
  eval "$(ssh-agent -a $SSH_AUTH_SOCK -s)" >/dev/null

  # Add all id_* keys (excluding .pub)
  for key in ~/.ssh/id_*; do
    [[ "$key" == *.pub ]] && continue
    ssh-add "$key" >/dev/null 2>&1
  done
fi
```

Then restart your terminal or run:

```bash
source ~/.zshrc   # or source ~/.bashrc
```

## ✅ Expected Result

After setup, you will:

* Have a stable SSH socket path (`~/.ssh/agent-socket`)
* Automatically start `ssh-agent` if needed
* Load all your private keys
* Be ready to bind this agent into any container

## 📆 DevContainer Bind Configuration

To forward the SSH agent into your container, ensure your `devcontainer.json` includes:

```json
"mounts": [
  "source=${localEnv:SSH_AUTH_SOCK},target=/ssh-agent,type=bind"
],
"remoteEnv": {
  "SSH_AUTH_SOCK": "/ssh-agent"
}
```

This tells VS Code to bind the host’s fixed socket into the container and override the socket path inside.

## 🖠️ Troubleshooting

* If no keys are loaded, use `ssh-add -l` to confirm agent is running.
* You can manually add keys using `ssh-add ~/.ssh/id_ed25519`, etc.
* Ensure your DevContainer mounts are set correctly and the path `/ssh-agent` is accessible.

## 🔐 Security Tip

Avoid sharing your socket over insecure mounts or across unrelated containers. This method is meant for **personal development environments** only.
