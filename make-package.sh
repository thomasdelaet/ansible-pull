#!/bin/sh

rm -rf tmp/ &&
mkdir -p tmp &&
cp ansible-pull-bootstrap.sh tmp/ &&
cp ansible-pull.sh tmp/ &&
cp ansible-pull-cron tmp/ &&
(cd tmp && tar -czf ../ansible-pull-bootstrap.tar.gz .)

