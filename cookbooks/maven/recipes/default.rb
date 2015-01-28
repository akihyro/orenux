#=======================================================================================================================
# Maven
#=======================================================================================================================

# キャッシュディレクトリ
directory '/vagrant/.orenux-cache/maven'

# ダウンロード
remote_file '/vagrant/.orenux-cache/maven/apache-maven-3.2.5-bin.tar.gz' do
  source 'http://ftp.riken.jp/net/apache/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz'
  checksum '8c190264bdf591ff9f1268dc0ad940a2726f9e958e367716a09b8aaa7e74a755'
end

# 展開
bash 'maven::extract' do
  not_if <<-EOC
    test -d /opt/maven-3.2.5
  EOC
  code <<-EOC
    tar xfz /vagrant/.orenux-cache/maven/apache-maven-3.2.5-bin.tar.gz -C /opt
    mv /opt/apache-maven-3.2.5 /opt/maven-3.2.5
  EOC
end

# 環境設定 (即時)
ruby_block 'maven::env' do
  not_if do
    ENV['M2_HOME'] == '/opt/maven-3.2.5'
  end
  block do
    ENV['M2_HOME'] = '/opt/maven-3.2.5'
    ENV['PATH'] = "#{ENV['M2_HOME']}/bin:#{ENV['PATH']}"
  end
end

# 環境設定 (次回以降)
template '/etc/profile.d/maven.sh'
