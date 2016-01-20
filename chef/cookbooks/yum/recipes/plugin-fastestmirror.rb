#=======================================================================================================================
# yum: fastestmirror プラグイン
#=======================================================================================================================

# インストール
yum_package "yum-plugin-fastestmirror"

# 設定
template "/etc/yum/pluginconf.d/fastestmirror.conf" do
  source "plugin-fastestmirror.fastestmirror.conf.erb"
end
