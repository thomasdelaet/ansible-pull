#!/bin/sh

KEY="/root/.ssh/deployment_key"

ansible-galaxy install -r /root/ansible/requirements.yml

#just run to enable ansible-pull timer when booted
ansible-pull \
    --private-key ${KEY} \
    -i "$(hostname --short)" \
    -l "$(hostname --short)" \
    -U "git@github.com:thomasdelaet/ansible.git" \
    --accept-host-key \
    --full \
    --checkout main \
    --directory /root/ansible \
    --force
