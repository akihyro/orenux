#=======================================================================================================================
# yum: rpmforge リポジトリ
#=======================================================================================================================

# ダウンロード
remote_file '/vagrant/.orenux-cache/yum/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm' do
  source 'http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm'
  checksum '1f98252908e397f70a216964ed836e93ba4e80550eac343586895a993a41afb7'
end

# インストール
rpm_package 'rpmforge-release' do
  source '/vagrant/.orenux-cache/yum/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm'
end

# 無効化
# ※利用時は、 "--enablerepo=rpmforge" オプションを都度付与して有効化する。
bash 'yum::repo-rpmforge::disable' do
  only_if <<-EOC
    egrep -q 'enabled\\s*=\\s*1' /etc/yum.repos.d/rpmforge.repo
  EOC
  code <<-EOC
    sed -i -e 's/enabled\\s*=\\s*1/enabled=0/g' /etc/yum.repos.d/rpmforge.repo
  EOC
end
