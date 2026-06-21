---
name: package
description: Regenerates ansible-pull-bootstrap.tar.gz from the four core files, then commits and pushes. Run after editing any of the packaged files.
disable-model-invocation: true
---

Run ./make-package.sh from the repository root. This will:
1. Rebuild the tarball from ansible-pull-bootstrap.sh, ansible-pull.sh, ansible-pull-cron, and ssh_config
2. Commit all changes with message "update"
3. Push to origin main

If any errors occur (e.g., git push fails due to uncommitted changes or auth issues), report them to the user.
