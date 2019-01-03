#!/bin/bash
set -ex
hostname master.vm
echo '192.168.50.4 master.vm master' >> /etc/hosts
mkdir -p /etc/puppetlabs/puppet
echo '*' > /etc/puppetlabs/puppet/autosign.conf
curl -Lo pe.archive 'https://pm.puppetlabs.com/puppet-enterprise/2018.1.3/puppet-enterprise-2018.1.3-el-7-x86_64.tar.gz'  
tar -xf pe.archive
cat > pe.conf <<-EOF
{
  "console_admin_password": "puppetlabs"
  "puppet_enterprise::puppet_master_host": "%{::trusted.certname}"
  "puppet_enterprise::profile::master::check_for_updates": false
}
EOF
./puppet-enterprise-*-el-7-x86_64/puppet-enterprise-installer -c pe.conf
/opt/puppetlabs/bin/puppet apply -e 'include pe_repo::platform::windows_x86_64'
systemctl stop firewalld
systemctl disable firewalld
