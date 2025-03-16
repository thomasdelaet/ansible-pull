#!/bin/sh

KEY="/root/.ssh/deployment_key"

export PATH=$PATH:/usr/local/bin
export PIP_BREAK_SYSTEM_PACKAGES=1

apt-get -y install python3-pip

PIP_BREAK_SYSTEM_PACKAGES=1 pip3 install ansible netaddr

ansible-galaxy install -r /root/ansible/requirements.yml

inventory_hostname="$(hostname -d | cut -d'.' -f1)--$(hostname -s | sed -e s'/-wifi$//g')"

#just run to enable ansible-pull timer when booted
PIP_BREAK_SYSTEM_PACKAGES=1 ansible-pull \
    --private-key ${KEY} \
    -i "${inventory_hostname}" \
    -l "${inventory_hostname}" \
    -U "git@github.com:thomasdelaet/ansible.git" \
    --accept-host-key \
    --full \
    --checkout main \
    --directory /root/ansible \
    --force
