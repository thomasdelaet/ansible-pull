#!/bin/sh

rm -rf tmp/ &&
mkdir -p tmp &&
cp ansible-pull-bootstrap.sh tmp/ &&
cp ansible-pull.sh tmp/ &&
cp ansible-pull-cron tmp/ &&
cp ssh_config tmp/ &&
(cd tmp && tar -czf ../ansible-pull-bootstrap.tar.gz .) &&
git add .; git commit -m 'update'; git push