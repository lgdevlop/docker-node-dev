# 🤝 Contributing Guide

Thank you for considering contributing to this project!
This document outlines the standards and workflows expected from all contributors.
Following these conventions ensures consistency, automation compatibility, and a high-quality developer experience.

## 🌿 Branch Naming Convention

Branches must follow the standard format:

```bash
<type>/<scope>-<kebab-case-description>
```

Examples:

* `docs/ssh-agent-setup-guide`
* `feat/devcontainer-add-java-support`
* `fix/ci-docker-tag-conflict`

📘 Refer to: [`branch-naming-guidelines.md`](./project-docs/branch-naming-guidelines.md)

## ✍️ Commit Message Format

Use [semantic commit messages](https://www.conventionalcommits.org/) with emojis and scope. Example:

```bash
📚 docs: add SSH agent setup guide and link in README (#2)
```

For merge commits, use this structure:

* Title: semantic + PR number
* Body: context, list of changes, and reference to PR

📘 See: [`merge-commit-guidelines.md`](./project-docs/merge-commit-guidelines.md)

## 🚀 Pull Request Structure

All PRs must follow the [PR Template](./.github/pull_request_template.md). It includes:

* `What was done`: Start with `This PR introduces:` and bullet the changes
* `Why it matters`: State the motivation or solved issue
* `How to test`: Provide reproducible steps
* `Related`: Link to issues or dependent PRs

> The template is preloaded by GitHub when opening a PR.

## ✅ Checklist Before Opening a PR

* [ ] Branch name follows naming convention
* [ ] Commits follow semantic format
* [ ] PR description is filled using the template
* [ ] All tests (if applicable) pass locally
* [ ] Documentation was updated (if necessary)

## 🧠 Need Help?

For guidance, check the documents inside [`project-docs/`](./project-docs/) or ask in the repository discussions.

We're happy to support contributions and help onboard you!

> Maintained by Leonardo Gomes — Built to scale with clarity and automation in mind.
