#=======================================================================================================================
# Vagrant
#=======================================================================================================================

# キャッシュディレクトリ
directory '/vagrant/.orenux-cache/vagrant'

# ダウンロード
remote_file '/vagrant/.orenux-cache/vagrant/vagrant_1.7.4_x86_64.rpm' do
  source 'https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.4_x86_64.rpm'
  checksum 'b0a09f6e6f9fc17b01373ff54d1f5b0dc844394886109ef407a5f1bcfdd4e304'
end

# インストール
rpm_package '/vagrant/.orenux-cache/vagrant/vagrant_1.7.4_x86_64.rpm'
