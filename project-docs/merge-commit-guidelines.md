# ✅ Merge Commit Guidelines

This document outlines the recommended structure and best practices for writing merge commit messages when using GitHub Pull Requests with the "Merge with commit message" option.

It ensures:

* Consistency across the commit history
* Clear linkage between commits and their respective PRs
* Enhanced readability and traceability for automation, changelogs, and future metrics

## 📌 Message Title Format

Use this structure for the first line (commit summary):

```text
<emoji> <type>(<scope>): <summary> (#<PR_NUMBER>)
```

### ✅ Message Title Format - Example

```text
📚 docs: add SSH agent setup guide and link in README (#2)
```

### 🔎 Components

| Component     | Description                                             |
| ------------- | ------------------------------------------------------- |
| `<emoji>`     | Visual indicator of change type (e.g. 📚, ✨, 🐛, 🔧)  |
| `<type>`      | Conventional commit type (feat, fix, docs, chore, etc.) |
| `<scope>`     | Optional: folder, module, or feature affected           |
| `<summary>`   | Short, imperative sentence explaining the change        |
| `(#<number>)` | Reference to the Pull Request ID                        |

---

## 🧾 Commit Body Format (Extended Description)

The body should offer reviewers and future readers context and clarity.

### ✅ Suggested Template

```markdown
This commit introduces:

- <bullet 1>
- <bullet 2>

These changes address <goal/issue/motivation>. They help ensure <impact on project or team>.

Merged pull request #<number> from `<branch-name>`
```

### ✅ Commit Body Format - Example

```markdown
This commit introduces:

- `project-docs/ssh-agent-setup.md`: detailed instructions to configure a persistent ssh-agent on the host side
- A link in `README.md` marking the setup as required for SSH and Git functionality inside containers

These changes ensure smoother DevContainer onboarding and prevent common issues when accessing private repositories from within the containerized environment.

Merged pull request #2 from `docs/ssh-agent-setup-guide`
```

## 🧠 Why This Matters

* Adds clarity in `git log` and GitHub’s UI
* Facilitates `git log --grep='(#'` to filter commits with PR references
* Allows better changelog automation (e.g., filtering by PR scope or number)
* Helps onboard new team members with clearly segmented histories

## 📎 Related Conventions

* Based on [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
* Emojis based on [gitmoji](https://gitmoji.dev/)
* Designed to work seamlessly with GitHub Actions, Changesets, and semantic versioning

> ✍️ Feel free to adapt this template for release merges, squash merges, or other workflows if needed.
