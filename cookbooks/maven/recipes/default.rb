#=======================================================================================================================
# Maven
#=======================================================================================================================

# キャッシュディレクトリ
directory '/vagrant/.orenux-cache/maven'

# ダウンロード
remote_file '/vagrant/.orenux-cache/maven/apache-maven-3.2.3-bin.tar.gz' do
  source 'http://ftp.riken.jp/net/apache/maven/maven-3/3.2.3/binaries/apache-maven-3.2.3-bin.tar.gz'
  checksum 'bf3f04aadee3a67158aebdfb0b4cb022063329d459d10fd6b4b02223e10aa8ed'
end

# 展開
bash 'maven::extract' do
  not_if <<-EOC
    test -d /opt/maven-3.2.3
  EOC
  code <<-EOC
    tar xfz /vagrant/.orenux-cache/maven/apache-maven-3.2.3-bin.tar.gz -C /opt
    mv /opt/apache-maven-3.2.3 /opt/maven-3.2.3
  EOC
end

# 設定
template '/opt/maven-3.2.3/conf/settings.xml' do
  proxy = ENV['http_proxy'] || ENV['HTTP_PROXY']
  proxy = URI.parse(proxy) if proxy
  no_proxy = ENV['no_proxy'] || ENV['NO_PROXY']
  variables(
    :proxy => proxy ? {
      :protocol        => proxy.scheme,
      :host            => proxy.host,
      :port            => proxy.port,
      :non_proxy_hosts => no_proxy.gsub(',', '|'),
    } : nil,
  )
end

# 環境設定 (即時)
ruby_block 'maven::env' do
  not_if do
    ENV['M2_HOME'] == '/opt/maven-3.2.3'
  end
  block do
    ENV['M2_HOME'] = '/opt/maven-3.2.3'
    ENV['PATH'] = "#{ENV['M2_HOME']}/bin:#{ENV['PATH']}"
  end
end

# 環境設定 (次回以降)
template '/etc/profile.d/maven.sh'
