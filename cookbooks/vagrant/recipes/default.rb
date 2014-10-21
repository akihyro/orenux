#=======================================================================================================================
# Vagrant
#=======================================================================================================================

# キャッシュディレクトリ
directory '/vagrant/.orenux-cache/vagrant'

# ダウンロード
remote_file '/vagrant/.orenux-cache/vagrant/vagrant_1.6.5_x86_64.rpm' do
  source 'https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.5_x86_64.rpm'
  checksum '90730fd10cbd811969ec58f28818685f3074f8399852dfd1d4858d75c4224fdc'
end

# インストール
rpm_package '/vagrant/.orenux-cache/vagrant/vagrant_1.6.5_x86_64.rpm'
