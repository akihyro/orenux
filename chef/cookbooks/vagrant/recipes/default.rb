#=======================================================================================================================
# Vagrant
#=======================================================================================================================

# ダウンロード
resource_file_path = "#{Chef::Config[:file_cache_path]}/vagrant_1.8.1_x86_64.rpm"
remote_file resource_file_path do
  source "https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.rpm"
end

# インストール
yum_package resource_file_path
