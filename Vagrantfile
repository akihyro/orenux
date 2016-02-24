#=======================================================================================================================
# Vagrant
#=======================================================================================================================

Vagrant.configure(VAGRANTFILE_API_VERSION = 2) do |config|

  config.vm.hostname = "orenux"
  config.vm.synced_folder ENV['HOME'], "/host/home"

  config.vm.define :orenux, primary: true do |orenux|

    orenux.vm.box = "opscode-centos-6.7"
    orenux.vm.box_url =
      "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.7_chef-provisionerless.box"
    orenux.vm.network :private_network, ip: "192.168.33.10"

    orenux.vm.provider :virtualbox do |virtualbox|
      virtualbox.cpus = 1
      virtualbox.memory = 1024
      virtualbox.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      virtualbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end

    orenux.vm.provision :chef_zero do |chef|
      chef.version = "12.7.2"
      chef.cookbooks_path = "chef/cookbooks"
      chef.roles_path = "chef/roles"
      chef.nodes_path = "chef/nodes"
      chef.run_list = ["role[orenux]"]
    end

  end

  config.vm.define :ci, autostart: false do |ci|

    ci.vm.provider :docker do |docker|
      docker.build_dir = "ci/docker"
      docker.build_args = ["--rm=false"]
      docker.has_ssh = true
    end

    ci.vm.provision :chef_zero do |chef|
      chef.version = "12.7.2"
      chef.cookbooks_path = "chef/cookbooks"
      chef.roles_path = "chef/roles"
      chef.nodes_path = "chef/nodes"
      chef.run_list = ["role[orenux]"]
    end

  end

end
