#=======================================================================================================================
# Node.js
#=======================================================================================================================

# キャッシュディレクトリ
directory '/vagrant/.orenux-cache/nodejs'

# ダウンロード
remote_file '/vagrant/.orenux-cache/nodejs/node-v0.12.7-linux-x64.tar.gz' do
  source 'https://nodejs.org/dist/v0.12.7/node-v0.12.7-linux-x64.tar.gz'
  checksum '6a2b3077f293d17e2a1e6dba0297f761c9e981c255a2c82f329d4173acf9b9d5'
end

# 展開
bash 'nodejs::extract' do
  not_if <<-EOC
    test -d /opt/nodejs-0.12.7
  EOC
  code <<-EOC
    tar xfz /vagrant/.orenux-cache/nodejs/node-v0.12.7-linux-x64.tar.gz -C /opt
    mv /opt/node-v0.12.7-linux-x64 /opt/nodejs-0.12.7
  EOC
end

# 環境設定 (即時)
ruby_block 'nodejs::env' do
  not_if do
    ENV['NODEJS_HOME'] == '/opt/nodejs-0.12.7'
  end
  block do
    ENV['NODEJS_HOME'] = '/opt/nodejs-0.12.7'
    ENV['PATH'] = "#{ENV['NODEJS_HOME']}/bin:#{ENV['PATH']}"
  end
end

# 環境設定 (次回以降)
template '/etc/profile.d/nodejs.sh'
