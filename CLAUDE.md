# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A minimal bootstrap package that sets up `ansible-pull` on remote hosts. Hosts download `ansible-pull-bootstrap.tar.gz` from GitHub (via curl/wget), extract it, and run `ansible-pull-bootstrap.sh`. After that, `ansible-pull.sh` runs every 10 minutes via cron to apply configurations from `thomasdelaet/ansible`.

## Packaged files

These four files are bundled into `ansible-pull-bootstrap.tar.gz`:
- `ansible-pull-bootstrap.sh` — sets up SSH, inventory, and clones the ansible repo
- `ansible-pull.sh` — installs ansible and runs ansible-pull (also the cron target); **kept in sync with** `~/Documents/ansible/roles/ansible-pull/files/ansible-pull.sh`
- `ansible-pull-cron` — cron schedule (once per hour, at minute 10)
- `ssh_config` — SSH config for GitHub access using `/root/.ssh/deployment_key`

## Critical workflow

**After editing any of the four packaged files, always run `./make-package.sh` before committing.** This script regenerates the tarball, then runs `git add . && git commit -m 'update' && git push` automatically. Do not commit the scripts and tarball separately.

## Syncing ansible-pull.sh

`ansible-pull.sh` is a copy of `~/Documents/ansible/roles/ansible-pull/files/ansible-pull.sh`. When changes are needed, sync from that source first, then package.
