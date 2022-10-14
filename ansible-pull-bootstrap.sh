#!/bin/sh

KEY="/root/.ssh/deployment_key"

#just run to enable ansible-pull timer when booted
ansible-pull \
    --verbose \
    --private-key ${KEY} \
    -i "$(hostname --short)" \
    -l "$(hostname --short)" \
    -U "git@github.com:thomasdelaet/ansible.git" \
    --accept-host-key \
    --tags ansible_pull_bootstrap \
    --checkout main
