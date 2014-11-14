#=======================================================================================================================
# GlassFish
#=======================================================================================================================

# キャッシュディレクトリ
directory '/vagrant/.orenux-cache/glassfish'

# ダウンロード
remote_file '/vagrant/.orenux-cache/glassfish/glassfish-4.1.zip' do
  source 'http://dlc.sun.com.edgesuite.net/glassfish/4.1/release/glassfish-4.1.zip'
  checksum '3edc5fc72b8be241a53eae83c22f274479d70e15bdfba7ba2302da5260f23e9d'
end

# 展開
bash 'glassfish::extract' do
  not_if <<-EOC
    test -d /opt/glassfish-4.1
  EOC
  code <<-EOC
    unzip -q -d /opt /vagrant/.orenux-cache/glassfish/glassfish-4.1.zip
    mv /opt/glassfish4 /opt/glassfish-4.1
  EOC
end

# 環境設定 (即時)
ruby_block 'glassfish::env' do
  not_if do
    ENV['GLASSFISH_HOME'] == '/opt/glassfish-4.1'
  end
  block do
    ENV['GLASSFISH_HOME'] = '/opt/glassfish-4.1'
    ENV['PATH'] = "#{ENV['GLASSFISH_HOME']}/bin:#{ENV['PATH']}"
  end
end

# 環境設定 (次回以降)
template '/etc/profile.d/glassfish.sh'
