#!/bin/sh

KEY=""

#just run to enable ansible-pull timer when booted

#ansible-pull \
#    -U "git@github.com:thomasdelaet/ansible.git" \
#    -i "$(hostname --short)" \
#    --private-key ${KEY} \
#    --accept-host-key \
#    --verbose \
#    --tags ansible

echo "$(hostname --short)" > /etc/test