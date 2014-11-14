#=======================================================================================================================
# yum: remi リポジトリ
#=======================================================================================================================

# ダウンロード
remote_file '/vagrant/.orenux-cache/yum/remi-release-6.rpm' do
  source 'http://rpms.famillecollet.com/enterprise/remi-release-6.rpm'
  checksum 'caefe3e778f185535d80f21499dc50c5c388040e0966c96b539d8d05c907dc63'
end

# インストール
rpm_package 'remi-release' do
  source '/vagrant/.orenux-cache/yum/remi-release-6.rpm'
end

# 無効化
# ※利用時は、 "--enablerepo=remi" オプションを都度付与して有効化する。
bash 'yum::repo-remi::disable' do
  only_if <<-EOC
    egrep -q 'enabled\\s*=\\s*1' /etc/yum.repos.d/remi.repo
  EOC
  code <<-EOC
    sed -i -e 's/enabled\\s*=\\s*1/enabled=0/g' /etc/yum.repos.d/remi.repo
  EOC
end
