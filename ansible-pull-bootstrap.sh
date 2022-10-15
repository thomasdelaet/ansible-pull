#!/bin/sh

mv /root/ansible-pull-cron /etc/cron.d/ansible-pull
chmod o-rwx /root/.ssh
chmod g-rwx,o-rwx /root/.ssh/deployment_key
mv /root/ssh_config /root/.ssh/config
chmod g-rwx,o-rwx /root/.ssh/config
chown root:root /root/.ssh/config
mkdir -p /etc/ansible
echo "$(hostname --short) ansible_connection=local" > /etc/ansible/hosts
git clone git@github.com:thomasdelaet/ansible.git /root/ansible