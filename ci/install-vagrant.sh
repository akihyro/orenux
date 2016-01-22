#!/bin/bash
#=======================================================================================================================
# Vagrant インストール
#=======================================================================================================================

set -eux
set -o pipefail

mkdir -p ~/.vagrant.d
cd ~/.vagrant.d

wget -nc https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb
sudo dpkg -i vagrant_1.8.1_x86_64.deb
vagrant plugin install dotenv