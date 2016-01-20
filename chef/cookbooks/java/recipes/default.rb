#=======================================================================================================================
# Java
#=======================================================================================================================

# キャッシュディレクトリ
directory '/vagrant/.orenux-cache/java'

# ダウンロード
bash 'java::download' do
  not_if <<-EOC
    sha256sum /vagrant/.orenux-cache/java/jdk-8u60-linux-x64.tar.gz | \
        grep -q 'ebe51554d2f6c617a4ae8fc9a8742276e65af01bd273e96848b262b3c05424e5'
  EOC
  code <<-EOC
    curl -L -o /vagrant/.orenux-cache/java/jdk-8u60-linux-x64.tar.gz \
        -H 'Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com; oraclelicense=accept-securebackup-cookie' \
        'http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60-linux-x64.tar.gz'
  EOC
end

# 展開
bash 'java::extract' do
  not_if <<-EOC
    test -d /opt/jdk-1.8.0_60
  EOC
  code <<-EOC
    tar xfz /vagrant/.orenux-cache/java/jdk-8u60-linux-x64.tar.gz -C /opt
    mv /opt/jdk1.8.0_60 /opt/jdk-1.8.0_60
  EOC
end

# 環境設定 (即時)
ruby_block 'java::env' do
  not_if do
    ENV['JAVA_HOME'] == '/opt/jdk-1.8.0_60'
  end
  block do
    ENV['JAVA_HOME'] = '/opt/jdk-1.8.0_60'
    ENV['PATH'] = "#{ENV['JAVA_HOME']}/bin:#{ENV['PATH']}"
  end
end

# 環境設定 (次回以降)
template '/etc/profile.d/java.sh'
