#=======================================================================================================================
# Vagrant
#=======================================================================================================================

# キャッシュディレクトリ
directory '/vagrant/.orenux-cache/vagrant'

# ダウンロード
remote_file '/vagrant/.orenux-cache/vagrant/vagrant_1.7.2_x86_64.rpm' do
  source 'https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2_x86_64.rpm'
  checksum '683d9926922685adfb456605ef6becaa811b87f18f54faf7c19abc4888636617'
end

# インストール
rpm_package '/vagrant/.orenux-cache/vagrant/vagrant_1.7.2_x86_64.rpm'
