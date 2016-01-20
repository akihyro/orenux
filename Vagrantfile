#=======================================================================================================================
# Vagrant
#=======================================================================================================================

Vagrant.configure(VAGRANTFILE_API_VERSION = '2') do |config|

  # Boxファイル
  config.vm.box = 'opscode-centos-6.7'
  config.vm.box_url = 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.7_chef-provisionerless.box'

  # ネットワーク
  config.vm.hostname = 'orenux'
  config.vm.network :private_network, ip: '192.168.33.10'

  # 同期フォルダ
  config.vm.synced_folder ENV['HOME'], '/host/home'

  # VirtualBox
  config.vm.provider :virtualbox do |vb|
    vb.memory = 1024
    vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
  end

  # Chef
  config.vm.provision :chef_zero do |chef|
    chef.cookbooks_path = 'cookbooks'
    chef.nodes_path = 'nodes'
    chef.run_list = []
  end

end
