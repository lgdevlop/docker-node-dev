<!--
📘 Pull Request Template
This file is used by GitHub to pre-fill new PRs in this repository.
It follows a narrative format inspired by the actual PRs used in this project, with comments guiding the contributor.
-->

### ✍️ What was done

<!--
Briefly describe the change in this PR. Prefer starting with "This PR introduces:" followed by bullet points.
Mention new files, structural changes, or improvements.
Example:

This PR introduces:
- New guide: `project-docs/ssh-agent-setup.md`
- README link referencing the setup as required
-->

This PR introduces:

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
