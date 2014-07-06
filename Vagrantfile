Vagrant.configure(VAGRANTFILE_API_VERSION = "2") do |config|

  config.vm.box = 'opscode-centos-6.5'
  config.vm.box_url = 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.5_chef-provisionerless.box'

  config.vm.hostname = 'orenux'

  config.vm.synced_folder 'C:/', '/win/c'
  config.vm.synced_folder ENV['HOME'], '/win/home'

  config.omnibus.chef_version = :latest
  config.vm.provision :chef_solo do |chef|
    chef.custom_config_path = 'Vagrantfile.chef'
    chef.run_list = [
      'timezone',
      'locale',
      'hist-settings',
      'epel',
      'rpmforge',
      'ius',
      'remi',
      'gcc',
      'openssl-devel',
      'bash-completion',
      'bind-utils',
      'vim',
      'lv',
      'git',
      'peco',
      'sl',
      'user-akihyro',
    ]
  end

end
