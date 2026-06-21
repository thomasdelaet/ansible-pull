---
name: sync-ansible-pull
description: Syncs ansible-pull.sh from ~/Documents/ansible/roles/ansible-pull/files/ansible-pull.sh into this repo. Run when the source file has changed and this repo needs updating.
disable-model-invocation: true
---

1. Copy the source file into the repo:
   ```
   cp ~/Documents/ansible/roles/ansible-pull/files/ansible-pull.sh ./ansible-pull.sh
   ```
2. Show the user a diff of what changed:
   ```
   git diff ansible-pull.sh
   ```
3. Ask the user to confirm the diff looks correct before proceeding.
4. If confirmed, remind the user to run `/package` to regenerate the tarball and push.
