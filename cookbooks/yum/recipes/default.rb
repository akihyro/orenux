#=======================================================================================================================
# yum
#=======================================================================================================================

# キャッシュディレクトリ
directory '/vagrant/.orenux-cache/yum'

# プラグイン fastestmirror インストール
yum_package 'yum-plugin-fastestmirror'


# アップデート
bash 'yum_update' do
  code <<-EOC
    yum update -y
  EOC
end


# リポジトリ epel ダウンロード
remote_file '/vagrant/.orenux-cache/yum/epel-release-6-8.noarch.rpm' do
  source 'http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm'
  checksum 'e5ed9ecf22d0c4279e92075a64c757ad2b38049bcf5c16c4f2b75d5f6860dc0d'
end

# リポジトリ epel インストール
rpm_package 'epel' do
  source '/vagrant/.orenux-cache/yum/epel-release-6-8.noarch.rpm'
end

# リポジトリ epel 無効化
# ※利用時は、 "--enablerepo=epel" オプションを都度付与して有効化する。
bash 'yum_epel_disable' do
  only_if <<-EOC
    egrep -q 'enabled\\s*=\\s*1' /etc/yum.repos.d/epel.repo
  EOC
  code <<-EOC
    sed -i -e 's/enabled\\s*=\\s*1/enabled=0/g' /etc/yum.repos.d/epel.repo
  EOC
end


# リポジトリ rpmforge ダウンロード
remote_file '/vagrant/.orenux-cache/yum/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm' do
  source 'http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm'
  checksum '1f98252908e397f70a216964ed836e93ba4e80550eac343586895a993a41afb7'
end

# リポジトリ rpmforge インストール
rpm_package 'rpmforge' do
  source '/vagrant/.orenux-cache/yum/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm'
end

# リポジトリ rpmforge 無効化
# ※利用時は、 "--enablerepo=rpmforge" オプションを都度付与して有効化する。
bash 'yum_rpmforge_disable' do
  only_if <<-EOC
    egrep -q 'enabled\\s*=\\s*1' /etc/yum.repos.d/rpmforge.repo
  EOC
  code <<-EOC
    sed -i -e 's/enabled\\s*=\\s*1/enabled=0/g' /etc/yum.repos.d/rpmforge.repo
  EOC
end


# リポジトリ ius ダウンロード
remote_file '/vagrant/.orenux-cache/yum/ius-release-1.0-13.ius.centos6.noarch.rpm' do
  source 'http://dl.iuscommunity.org/pub/ius/stable/CentOS/6/x86_64/ius-release-1.0-13.ius.centos6.noarch.rpm'
  checksum '8d2f0ef2b89b71c9e179ba9c033abded439e0a62edbd3b86a3c8eb77ae49875f'
end

# リポジトリ ius インストール
rpm_package 'ius' do
  source '/vagrant/.orenux-cache/yum/ius-release-1.0-13.ius.centos6.noarch.rpm'
end

# リポジトリ ius 無効化
# ※利用時は、 "--enablerepo=ius" オプションを都度付与して有効化する。
bash 'yum_ius_disable' do
  only_if <<-EOC
    egrep -q 'enabled\\s*=\\s*1' /etc/yum.repos.d/ius.repo
  EOC
  code <<-EOC
    sed -i -e 's/enabled\\s*=\\s*1/enabled=0/g' /etc/yum.repos.d/ius.repo
  EOC
end


# リポジトリ remi ダウンロード
remote_file '/vagrant/.orenux-cache/yum/remi-release-6.rpm' do
  source 'http://rpms.famillecollet.com/enterprise/remi-release-6.rpm'
  checksum 'caefe3e778f185535d80f21499dc50c5c388040e0966c96b539d8d05c907dc63'
end

# リポジトリ remi インストール
rpm_package 'remi' do
  source '/vagrant/.orenux-cache/yum/remi-release-6.rpm'
end

# リポジトリ remi 無効化
# ※利用時は、 "--enablerepo=remi" オプションを都度付与して有効化する。
bash 'yum_remi_disable' do
  only_if <<-EOC
    egrep -q 'enabled\\s*=\\s*1' /etc/yum.repos.d/remi.repo
  EOC
  code <<-EOC
    sed -i -e 's/enabled\\s*=\\s*1/enabled=0/g' /etc/yum.repos.d/remi.repo
  EOC
end
