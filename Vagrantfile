#=======================================================================================================================
# Vagrant 設定
#=======================================================================================================================

Vagrant.configure(VAGRANTFILE_API_VERSION = "2") do |config|

  # Boxファイル
  config.vm.box = 'opscode-centos-6.5'
  config.vm.box_url = 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.5_chef-provisionerless.box'

  # ネットワーク
  config.vm.hostname = 'orenux'
  config.vm.network :private_network, ip: '192.168.33.10'

  # プロキシ
  config.proxy.http = ENV['http_proxy']
  config.proxy.https = ENV['https_proxy']
  config.proxy.no_proxy = ENV['no_proxy']

  # 同期フォルダ
  config.vm.synced_folder 'C:/', '/win/c'
  config.vm.synced_folder ENV['HOME'], '/win/home'

  # キャッシュ
  config.cache.scope = :box

  # Chef
  config.omnibus.chef_version = :latest
  config.vm.provision :chef_solo do |chef|
    chef.custom_config_path = 'Vagrantfile.chef'
    chef.run_list = [
      'locale',
      'yum',
      'gcc',
      'openssl-devel',
      'bash-completion',
      'unzip',
      'bind-utils',
      'vim',
      'lv',
      'tree',
      'samba',
      'git',
      'ruby',
      'peco',
      'java',
      'maven',
      'glassfish',
      'nodejs',
      'redis',
      'vagrant',
      'sl',
      'hist-settings',
      'ps-settings',
      'user-akihyro',
    ]
  end

end
