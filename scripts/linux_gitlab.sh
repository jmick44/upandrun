#/bin/bash
set -ex
hostname gitlab.vm
echo '192.168.50.4 master.vm master' >> /etc/hosts
echo '192.168.50.8 gitlab.vm linux' >> /etc/hosts
curl -k https://master.vm:8140/packages/current/install.bash | bash
curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash
yum -y install gitlab-ce
sed -i 's/gitlab.example.com/gitlab.vm/g' /etc/gitlab/gitlab.rb
sudo gitlab-ctl reconfigure
