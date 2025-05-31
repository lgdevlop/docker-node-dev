<!--
📘 Pull Request Template
This file is used by GitHub to pre-fill new PRs in this repository.
It follows a narrative format inspired by the actual PRs used in this project, with comments guiding the contributor.
-->

### ✍️ What was done

<!--
Start with a short paragraph explaining the purpose and scope of the PR.
Then, list the key changes using bullet points.
Example:

This PR introduces documentation for properly setting up an SSH agent on the **host machine** to ensure Git and SSH operations work correctly inside the DevContainers.

- Added `project-docs/ssh-agent-setup.md` with a complete, copy-pasteable setup guide
- Updated `README.md` to reference this document and highlight that this step is required
-->

This PR introduces...

* ...
* ...

### 📌 Why it matters

<!--
Explain the motivation behind the change.
What problem does it solve? Why is this important for users or developers?
Example:

Without this change, ...

This improvement ensures that ... and helps prevent ...
-->

Without this change, ...

### 🧪 How to test

<!--
Provide reproducible steps that reviewers can follow to validate the changes.
Use numbered steps where possible.
Example:

1. Apply the setup in your host's `.zshrc` or `.bashrc`
2. Reopen terminal and verify `ssh-add -l` returns valid keys
3. Open DevContainer and run a Git command that requires SSH (e.g., `git pull` from a private repo)
-->

1. ...
2. ...
3. ...

### 📎 Related

<!--
List any related issues, pull requests, or discussions.
Use GitHub keywords to automatically link (e.g., Closes #123, Depends on #456)
Example:

Closes #...
Depends on #...

Other Example:

No related issues, but this prepares ground for future improvements to DevContainer onboarding.
-->

Closes #...
Depends on #...

---

> ℹ️ Please squash unnecessary commits before requesting a review.
>
> 📚 Refer to `project-docs/merge-commit-guidelines.md` for commit message standards when merging.
