# AGENTS.md

This file provides guidance to coding agents when working with code in this repository. `CLAUDE.md` is a symlink to this file.

## What this repo is

A minimal bootstrap package that sets up `ansible-pull` on remote hosts. Hosts download `ansible-pull-bootstrap.tar.gz` from GitHub (via curl/wget), extract it, and run `ansible-pull-bootstrap.sh`. After that, `ansible-pull.sh` runs hourly via cron to apply configurations from `thomasdelaet/ansible`.

## Packaged files

These four files are bundled into `ansible-pull-bootstrap.tar.gz`:
- `ansible-pull-bootstrap.sh` — sets up SSH, inventory, and clones the ansible repo
- `ansible-pull.sh` — installs ansible and runs ansible-pull (also the cron target); a copy of `~/Documents/ansible/roles/ansible-pull/files/ansible-pull.sh`
- `ansible-pull-cron` — cron schedule (once per hour, at minute 10)
- `ssh_config` — SSH config for GitHub access using `/root/.ssh/deployment_key`

## Packaging: after editing any packaged file

Run `./make-package.sh` from the repo root. It rebuilds the tarball from the four files above, then runs `git add . && git commit -m 'update' && git push` automatically. Never commit the scripts and tarball separately. Report any errors (failed push, auth issues) to the user rather than working around them.

## Syncing ansible-pull.sh

`ansible-pull.sh` is a copy of `~/Documents/ansible/roles/ansible-pull/files/ansible-pull.sh`. When it needs updating, sync from that source first — do not edit the copy here directly:

1. `cp ~/Documents/ansible/roles/ansible-pull/files/ansible-pull.sh ./ansible-pull.sh`
2. `git diff ansible-pull.sh` and show the user the diff
3. Wait for the user to confirm the diff looks correct
4. Once confirmed, run `./make-package.sh` to regenerate the tarball and push
