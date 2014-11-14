#=======================================================================================================================
# Java
#=======================================================================================================================

# キャッシュディレクトリ
directory '/vagrant/.orenux-cache/java'

# ダウンロード
bash 'java::download' do
  not_if <<-EOC
    sha256sum /vagrant/.orenux-cache/java/jdk-8u25-linux-x64.tar.gz | \
        grep -q '057f660799be2307d2eefa694da9d3fce8e165807948f5bcaa04f72845d2f529'
  EOC
  code <<-EOC
    curl -L -o /vagrant/.orenux-cache/java/jdk-8u25-linux-x64.tar.gz \
        -H 'Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com; oraclelicense=accept-securebackup-cookie' \
        'http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jdk-8u25-linux-x64.tar.gz'
  EOC
end

# 展開
bash 'java::extract' do
  not_if <<-EOC
    test -d /opt/jdk-1.8.0_25
  EOC
  code <<-EOC
    tar xfz /vagrant/.orenux-cache/java/jdk-8u25-linux-x64.tar.gz -C /opt
    mv /opt/jdk1.8.0_25 /opt/jdk-1.8.0_25
  EOC
end

# 環境設定 (即時)
ruby_block 'java::env' do
  not_if do
    ENV['JAVA_HOME'] == '/opt/jdk-1.8.0_25'
  end
  block do
    ENV['JAVA_HOME'] = '/opt/jdk-1.8.0_25'
    ENV['PATH'] = "#{ENV['JAVA_HOME']}/bin:#{ENV['PATH']}"
  end
end

# 環境設定 (次回以降)
template '/etc/profile.d/java.sh'
