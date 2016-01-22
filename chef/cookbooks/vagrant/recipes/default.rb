#=======================================================================================================================
# Vagrant
#=======================================================================================================================

# ダウンロード
remote_file "#{Chef::Config[:file_cache_path]}/vagrant_1.8.1_x86_64.rpm" do
  source "https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.rpm"
end

# インストール
rpm_package "#{Chef::Config[:file_cache_path]}/vagrant_1.8.1_x86_64.rpm"
