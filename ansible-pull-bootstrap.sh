#!/bin/sh

inventory_hostname=$(hostname -s | sed -e s'/-wifi$//g')

#mv /root/ansible-pull-cron /etc/cron.d/ansible-pull
#chown root:root /etc/cron.d/ansible-pull
#chmod 644 /etc/cron.d/ansible-pull
if [ ! -f "/root/.ssh/config" ]
then
    mv /root/ssh_config /root/.ssh/config
fi
chown -R root:root /root
chmod -R o-rwx,g-rwx /root
chmod 644 /root/.ssh/config
mkdir -p /etc/ansible
echo "${inventory_hostname} ansible_connection=local" > /etc/ansible/hosts
if [ ! -d "/root/ansible" ]
then
    git clone git@github.com:thomasdelaet/ansible.git /root/ansible
else
    (cd /root/ansible; git pull origin)
fi
chown -R root:root /root
chmod -R o-rwx,g-rwx /root