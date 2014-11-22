#=======================================================================================================================
# yum: nginx リポジトリ
#=======================================================================================================================

# ダウンロード
remote_file '/vagrant/.orenux-cache/yum/nginx-release-centos-6-0.el6.ngx.noarch.rpm' do
  source 'http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm'
  checksum '4ee9cb15f3ad5c3bea4909bf8863983af4089484f50c1cdb94559016ea9fd244'
end

# インストール
rpm_package 'nginx-release' do
  source '/vagrant/.orenux-cache/yum/nginx-release-centos-6-0.el6.ngx.noarch.rpm'
end

# 無効化
# ※利用時は、 "--enablerepo=nginx" オプションを都度付与して有効化する。
bash 'yum::repo-nginx::disable' do
  only_if <<-EOC
    egrep -q 'enabled\\s*=\\s*1' /etc/yum.repos.d/nginx.repo
  EOC
  code <<-EOC
    sed -i -e 's/enabled\\s*=\\s*1/enabled=0/g' /etc/yum.repos.d/nginx.repo
  EOC
end
