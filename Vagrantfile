#=======================================================================================================================
# Vagrant
#=======================================================================================================================

Vagrant.configure(VAGRANTFILE_API_VERSION = 2) do |config|

  config.vm.hostname = 'orenux'
  config.vm.synced_folder ENV['HOME'], '/host/home'

  config.vm.provider :virtualbox do |virtualbox, config|
    config.vm.box = 'opscode-centos-6.7'
    config.vm.box_url =
      'http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.7_chef-provisionerless.box'
    config.vm.network :private_network, ip: '192.168.33.10'
    virtualbox.cpus = 1
    virtualbox.memory = 1024
    virtualbox.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
    virtualbox.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
  end

  config.vm.provider :docker do |docker, config|
    docker.build_dir = 'docker'
    docker.build_args = []
    docker.build_args << '--rm=false' if ENV['CIRCLECI']
    docker.has_ssh = true
  end

  config.vm.provision :chef_zero do |chef|
    chef.cookbooks_path = 'cookbooks'
    chef.nodes_path = 'nodes'
    chef.run_list = []
  end

end
