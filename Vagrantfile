#=======================================================================================================================
# Vagrant 設定
#=======================================================================================================================

Vagrant.configure(VAGRANTFILE_API_VERSION = "2") do |config|

  # Boxファイル
  config.vm.box = 'opscode-centos-6.7'
  config.vm.box_url = 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.7_chef-provisionerless.box'

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
    chef.cookbooks_path = "cookbooks"
    chef.run_list = [
      'base',
      'base::locale',
      'base::selinux',
      'base::history',
      'yum',
      'yum::update',
      'yum::plugin-fastestmirror',
      'yum::repo-epel',
      'yum::repo-nginx',
      'yum::repo-rpmforge',
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
      'aws',
      'aws::cli',
      'java',
      'jq',
      'maven',
      'nginx',
      'nodejs',
      'nodejs::bower',
      'nodejs::grunt',
      'peco',
      'ruby',
      'ruby::rbenv',
      'ruby::ruby',
      'samba',
      'vagrant',
      'akihyro',
      'akihyro::sudo',
      'akihyro::keys',
      'akihyro::samba',
      'akihyro::vagrant',
      'akihyro::dotfiles',
      'akihyro::repos',
    ]
  end

end
