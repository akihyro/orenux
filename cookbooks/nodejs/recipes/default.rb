#=======================================================================================================================
# Node.js
#=======================================================================================================================

# キャッシュディレクトリ
directory '/vagrant/.orenux-cache/nodejs'

# ダウンロード
remote_file '/vagrant/.orenux-cache/nodejs/node-v0.10.33-linux-x64.tar.gz' do
  source 'http://nodejs.org/dist/v0.10.33/node-v0.10.33-linux-x64.tar.gz'
  checksum '159e5485d0fb5c913201baae49f68fd428a7e3b08262e9bf5003c1b399705ca8'
end

# 展開
bash 'nodejs::extract' do
  not_if <<-EOC
    test -d /opt/nodejs-0.10.33
  EOC
  code <<-EOC
    tar xfz /vagrant/.orenux-cache/nodejs/node-v0.10.33-linux-x64.tar.gz -C /opt
    mv /opt/node-v0.10.33-linux-x64 /opt/nodejs-0.10.33
  EOC
end

# 環境設定 (即時)
ruby_block 'nodejs::env' do
  not_if do
    ENV['NODEJS_HOME'] == '/opt/nodejs-0.10.33'
  end
  block do
    ENV['NODEJS_HOME'] = '/opt/nodejs-0.10.33'
    ENV['PATH'] = "#{ENV['NODEJS_HOME']}/bin:#{ENV['PATH']}"
  end
end

# 環境設定 (次回以降)
template '/etc/profile.d/nodejs.sh'
