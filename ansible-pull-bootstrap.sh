#!/bin/sh

mv /root/ansible-pull-cron /etc/cron.d/ansible-pull
chown root:root /etc/cron.d/ansible-pull
chmod 644 /etc/cron.d/ansible-pull
mv /root/ssh_config /root/.ssh/config
mkdir -p /etc/ansible
echo "$(hostname --short) ansible_connection=local" > /etc/ansible/hosts
git clone git@github.com:thomasdelaet/ansible.git /root/ansible
chown -R root:root /root
chmod -R o-rwx,g-rwx /root