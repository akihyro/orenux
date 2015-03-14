#=======================================================================================================================
# Vagrant 設定
#=======================================================================================================================

Vagrant.configure(VAGRANTFILE_API_VERSION = "2") do |config|

  # Boxファイル
  config.vm.box = 'opscode-centos-6.6'
  config.vm.box_url = 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.6_chef-provisionerless.box'

  # ネットワーク
  config.vm.hostname = 'orenux'
  config.vm.network :private_network, ip: '192.168.33.10'

  # 同期フォルダ
  config.vm.synced_folder "#{ENV['SYSTEMDRIVE']}/", '/host/sys'
  config.vm.synced_folder ENV['HOME'], '/host/home'

  # VirtualBox
  config.vm.provider :virtualbox do |vb|
    vb.memory = 1024
    vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
  end

  # Chef
  config.vm.provision :chef_zero do |chef|
    chef.run_list = [
      'base',
      'base::locale',
      'base::selinux',
      'base::history',
      'yum',
      'yum::plugin-fastestmirror',
      'yum::repo-epel',
      'yum::repo-nginx',
      'yum::repo-rpmforge',
      'yum::update',
      'tools',
      'tools::autoconf',
      'tools::bash-completion',
      'tools::bind-utils',
      'tools::curl',
      'tools::expat',
      'tools::gcc',
      'tools::gettext',
      'tools::kernel',
      'tools::lv',
      'tools::openssl',
      'tools::perl',
      'tools::readline',
      'tools::rsync',
      'tools::libffi',
      'tools::sl',
      'tools::tree',
      'tools::unzip',
      'tools::vim',
      'tools::zlib',
      'git',
      'samba',
      'nginx',
      'ruby',
      'ruby::rbenv',
      'ruby::ruby',
      'peco',
      'nodejs',
      'nodejs::grunt',
      'nodejs::bower',
      'java',
      'maven',
      'glassfish',
      'redis',
      'redis::service',
      'vagrant',
      'akihyro',
      'akihyro::sudo',
      'akihyro::dotfiles',
      'akihyro::keys',
      'akihyro::samba',
      'akihyro::vagrant',
      'akihyro::repos',
    ]
  end

end
