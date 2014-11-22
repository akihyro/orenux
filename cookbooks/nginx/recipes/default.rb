#=======================================================================================================================
# nginx
#=======================================================================================================================

# インストール
yum_package 'nginx' do
  options '--enablerepo=nginx'
end

# サービス
service 'nginx' do
  action [:enable, :start]
end
