#!/bin/bash
set -ex
hostname replica.vm
echo '192.168.50.4 master.vm master' >> /etc/hosts
echo '192.168.50.7 replica.vm replica' >> /etc/hosts
curl -k https://master.vm:8140/packages/current/install.bash | bash
