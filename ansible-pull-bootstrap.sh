#!/bin/sh

mv /root/ansible-pull-cron /etc/cron.d/ansible-pull
chmod o-rwx /root/.ssh
chmod o-rwx /root/.ssh/deployment_key
