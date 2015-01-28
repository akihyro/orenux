#=======================================================================================================================
# Node.js
#=======================================================================================================================

# キャッシュディレクトリ
directory '/vagrant/.orenux-cache/nodejs'

# ダウンロード
remote_file '/vagrant/.orenux-cache/nodejs/node-v0.10.36-linux-x64.tar.gz' do
  source 'http://nodejs.org/dist/v0.10.36/node-v0.10.36-linux-x64.tar.gz'
  checksum '2bc13477684a9fe534bdc9d8f4a8caf6257a11953b57c42cad9b919ee259a0d5'
end

# 展開
bash 'nodejs::extract' do
  not_if <<-EOC
    test -d /opt/nodejs-0.10.36
  EOC
  code <<-EOC
    tar xfz /vagrant/.orenux-cache/nodejs/node-v0.10.36-linux-x64.tar.gz -C /opt
    mv /opt/node-v0.10.36-linux-x64 /opt/nodejs-0.10.36
  EOC
end

# 環境設定 (即時)
ruby_block 'nodejs::env' do
  not_if do
    ENV['NODEJS_HOME'] == '/opt/nodejs-0.10.36'
  end
  block do
    ENV['NODEJS_HOME'] = '/opt/nodejs-0.10.36'
    ENV['PATH'] = "#{ENV['NODEJS_HOME']}/bin:#{ENV['PATH']}"
  end
end

# 環境設定 (次回以降)
template '/etc/profile.d/nodejs.sh'
