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

  # プロキシ
  config.proxy.http = ENV['http_proxy'] || ENV['HTTP_PROXY']
  config.proxy.https = ENV['https_proxy'] || ENV['HTTPS_PROXY']
  config.proxy.no_proxy = ENV['no_proxy'] || ENV['NO_PROXY']

  # 同期フォルダ
  config.vm.synced_folder "#{ENV['SYSTEMDRIVE']}/", '/host/system'
  config.vm.synced_folder ENV['HOME'], '/host/home'

  # Chef
  config.omnibus.chef_version = :latest
  config.vm.provision :chef_solo do |chef|
    chef.custom_config_path = 'Vagrantfile.chef'
    chef.run_list = [
      'base',
      'base::locale',
      'base::selinux',
      'base::history',
      'base::prompt',
      'yum',
      'yum::plugin-fastestmirror',
      'yum::repo-epel',
      'yum::repo-ius',
      'yum::repo-remi',
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
      'tools::lv',
      'tools::openssl',
      'tools::perl',
      'tools::readline',
      'tools::sl',
      'tools::tree',
      'tools::unzip',
      'tools::vim',
      'tools::zlib',
      'git',
      'samba',
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
      'akihyro::repos',
    ]
  end

end
