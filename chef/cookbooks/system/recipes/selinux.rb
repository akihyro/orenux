#=======================================================================================================================
# System: SELinux
#=======================================================================================================================

# 無効化
bash "system::selinux::setenforce" do
  code "setenforce Permissive"
  only_if "getenforce | egrep -q Enforcing"
end
template "/etc/selinux/config" do
  source "selinux.config.erb"
end
