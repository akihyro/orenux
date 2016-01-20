#=======================================================================================================================
# System: SELinux
#=======================================================================================================================

# 一時的に無効化
bash "system::selinux::setenforce" do
  only_if "getenforce | egrep -q Enforcing"
  code "setenforce Permissive"
end

# 再起動後も無効化
template "/etc/selinux/config" do
  source "selinux.config.erb"
end
