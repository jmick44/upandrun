# upandrun #

A very simple vagrant environment for getting up and running with Puppet Enterprise. 

This repo provides you with a complete, yet simple environment that consists of a master (CentOS7), as well as a Linux (CentOS7) and Windows VM. It's been updated to add a VM running Gitlab and a separate VM for use as a replica in an HA configuration.

Shout out to Grace Andrews for putting this together! I have updated this fork to use Puppet Enterprise 2018.1.2.

## Pre-Steps ##

Before cloning this repo, you'll have to install both [Vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads). 

For downloads : https://puppet.com/download-puppet-enterprise/thank-you

Once both are installed, you'll be able to do the following steps from your CLI:

```
'git clone https://github.com/jmick44/upandrun'

'cd upandrun'

**vagrant up each vm separately, wait for the previous vm to load fully before bringing up the next one** 

'vagrant up /master/'

'vagrant up /linux/'

'vagrant up /windows/'

'vagrant up /gitlab/'

'vagrant up /replica/'

'vagrant hosts list'

**ssh into each box individually**

'vagrant ssh /master/'
'vagrant ssh /linux/'
to ssh into the windows box, you'll need remote desktop
```

In order to get into your boxes, you can either ssh in from your command line, or you can use the VirtualBox interface. You can read more on Vagrant commands in their [docs](https://www.vagrantup.com/docs/cli/). 

You can also see your console in the browser by going to 'https://192.168.50.4'. This should give you a view of the GUI for continued management of your nodes.
