#=======================================================================================================================
# yum: ius リポジトリ
#=======================================================================================================================

# ダウンロード
remote_file '/vagrant/.orenux-cache/yum/ius-release-1.0-13.ius.centos6.noarch.rpm' do
  source 'http://dl.iuscommunity.org/pub/ius/stable/CentOS/6/x86_64/ius-release-1.0-13.ius.centos6.noarch.rpm'
  checksum 'd894589a1598819cbfc8e269e3036a56b7a61bf92ec047336c3ca1997e8fb59d'
end

# インストール
rpm_package 'ius-release' do
  source '/vagrant/.orenux-cache/yum/ius-release-1.0-13.ius.centos6.noarch.rpm'
end

# 無効化
# ※利用時は、 "--enablerepo=ius" オプションを都度付与して有効化する。
bash 'yum::repo-ius::disable' do
  only_if <<-EOC
    egrep -q 'enabled\\s*=\\s*1' /etc/yum.repos.d/ius.repo
  EOC
  code <<-EOC
    sed -i -e 's/enabled\\s*=\\s*1/enabled=0/g' /etc/yum.repos.d/ius.repo
  EOC
end
