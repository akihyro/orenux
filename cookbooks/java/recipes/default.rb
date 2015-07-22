#=======================================================================================================================
# Java
#=======================================================================================================================

# キャッシュディレクトリ
directory '/vagrant/.orenux-cache/java'

# ダウンロード
bash 'java::download' do
  not_if <<-EOC
    sha256sum /vagrant/.orenux-cache/java/jdk-8u51-linux-x64.tar.gz | \
        grep -q 'd7149012cc51c2cdb8d3a1767825e0dfc36ca0419c3dae56d993cb2732cbeff1'
  EOC
  code <<-EOC
    curl -L -o /vagrant/.orenux-cache/java/jdk-8u51-linux-x64.tar.gz \
        -H 'Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com; oraclelicense=accept-securebackup-cookie' \
        'http://download.oracle.com/otn-pub/java/jdk/8u51-b16/jdk-8u51-linux-x64.tar.gz'
  EOC
end

# 展開
bash 'java::extract' do
  not_if <<-EOC
    test -d /opt/jdk-1.8.0_51
  EOC
  code <<-EOC
    tar xfz /vagrant/.orenux-cache/java/jdk-8u51-linux-x64.tar.gz -C /opt
    mv /opt/jdk1.8.0_51 /opt/jdk-1.8.0_51
  EOC
end

# 環境設定 (即時)
ruby_block 'java::env' do
  not_if do
    ENV['JAVA_HOME'] == '/opt/jdk-1.8.0_51'
  end
  block do
    ENV['JAVA_HOME'] = '/opt/jdk-1.8.0_51'
    ENV['PATH'] = "#{ENV['JAVA_HOME']}/bin:#{ENV['PATH']}"
  end
end

# 環境設定 (次回以降)
template '/etc/profile.d/java.sh'
