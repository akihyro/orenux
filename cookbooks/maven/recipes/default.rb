#=======================================================================================================================
# Maven
#=======================================================================================================================

# キャッシュディレクトリ
directory '/vagrant/.orenux-cache/maven'

# ダウンロード
remote_file '/vagrant/.orenux-cache/maven/apache-maven-3.3.3-bin.tar.gz' do
  source 'http://ftp.jaist.ac.jp/pub/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz'
  checksum '3a8dc4a12ab9f3607a1a2097bbab0150c947ad6719d8f1bb6d5b47d0fb0c4779'
end

# 展開
bash 'maven::extract' do
  not_if <<-EOC
    test -d /opt/maven-3.3.3
  EOC
  code <<-EOC
    tar xfz /vagrant/.orenux-cache/maven/apache-maven-3.3.3-bin.tar.gz -C /opt
    mv /opt/apache-maven-3.3.3 /opt/maven-3.3.3
  EOC
end

# 環境設定 (即時)
ruby_block 'maven::env' do
  not_if do
    ENV['M2_HOME'] == '/opt/maven-3.3.3'
  end
  block do
    ENV['M2_HOME'] = '/opt/maven-3.3.3'
    ENV['PATH'] = "#{ENV['M2_HOME']}/bin:#{ENV['PATH']}"
  end
end

# 環境設定 (次回以降)
template '/etc/profile.d/maven.sh'
