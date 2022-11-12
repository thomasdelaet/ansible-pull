#!/bin/sh

KEY="/root/.ssh/deployment_key"

export PATH=$PATH:/usr/local/bin

apt-get -y install python3-pip

pip3 install ansible

ansible-galaxy install -r /root/ansible/requirements.yml

inventory_hostname=$(hostname -s | sed -e s'/-wifi$//g')

#just run to enable ansible-pull timer when booted
ansible-pull \
    --private-key ${KEY} \
    -i "${inventory_hostname}" \
    -l "${inventory_hostname}" \
    -U "git@github.com:thomasdelaet/ansible.git" \
    --accept-host-key \
    --full \
    --checkout main \
    --directory /root/ansible \
    --force
