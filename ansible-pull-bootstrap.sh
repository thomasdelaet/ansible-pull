#!/bin/sh

mv /root/ansible-pull-cron /etc/cron.d/ansible-pull
chmod o-rwx /root/.ssh
chmod o-rwx /root/.ssh/deployment_key
mkdir -p /etc/ansible
echo "$(hostname --short) ansible_connection=local" > /etc/ansible/hosts