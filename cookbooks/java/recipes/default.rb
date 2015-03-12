#=======================================================================================================================
# Java
#=======================================================================================================================

# キャッシュディレクトリ
directory '/vagrant/.orenux-cache/java'

# ダウンロード
bash 'java::download' do
  not_if <<-EOC
    sha256sum /vagrant/.orenux-cache/java/jdk-8u40-linux-x64.tar.gz | \
        grep -q 'c66029684bb8aa0c0eaea7b4d21de00e36a43dcc5a82f6666d489fd27027d559'
  EOC
  code <<-EOC
    curl -L -o /vagrant/.orenux-cache/java/jdk-8u40-linux-x64.tar.gz \
        -H 'Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com; oraclelicense=accept-securebackup-cookie' \
        'http://download.oracle.com/otn-pub/java/jdk/8u40-b25/jdk-8u40-linux-x64.tar.gz'
  EOC
end

# 展開
bash 'java::extract' do
  not_if <<-EOC
    test -d /opt/jdk-1.8.0_40
  EOC
  code <<-EOC
    tar xfz /vagrant/.orenux-cache/java/jdk-8u40-linux-x64.tar.gz -C /opt
    mv /opt/jdk1.8.0_40 /opt/jdk-1.8.0_40
  EOC
end

# 環境設定 (即時)
ruby_block 'java::env' do
  not_if do
    ENV['JAVA_HOME'] == '/opt/jdk-1.8.0_40'
  end
  block do
    ENV['JAVA_HOME'] = '/opt/jdk-1.8.0_40'
    ENV['PATH'] = "#{ENV['JAVA_HOME']}/bin:#{ENV['PATH']}"
  end
end

# 環境設定 (次回以降)
template '/etc/profile.d/java.sh'
