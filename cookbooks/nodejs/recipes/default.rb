#=======================================================================================================================
# Node.js
#=======================================================================================================================

# キャッシュディレクトリ
directory '/vagrant/.orenux-cache/nodejs'

# ダウンロード
remote_file '/vagrant/.orenux-cache/nodejs/node-v0.10.32-linux-x64.tar.gz' do
  source 'http://nodejs.org/dist/v0.10.32/node-v0.10.32-linux-x64.tar.gz'
  checksum '621777798ed9523a4ad1c4d934f94b7bc765871d769a014a53a4f1f7bcb5d5a7'
end

# 展開
bash 'nodejs_extract' do
  not_if <<-EOC
    test -d /opt/nodejs-0.10.32
  EOC
  code <<-EOC
    tar xfz /vagrant/.orenux-cache/nodejs/node-v0.10.32-linux-x64.tar.gz -C /opt
    mv /opt/node-v0.10.32-linux-x64 /opt/nodejs-0.10.32
  EOC
end

# 環境設定
template '/etc/profile.d/nodejs.sh'


# grunt-cli インストール
bash 'npm_install_grunt' do
  not_if <<-EOC
    . /etc/profile.d/nodejs.sh
    npm ls --global grunt-cli | grep -q grunt-cli
  EOC
  code <<-EOC
    . /etc/profile.d/nodejs.sh
    npm install --global grunt-cli
  EOC
end

# bower インストール
bash 'npm_install_bower' do
  not_if <<-EOC
    . /etc/profile.d/nodejs.sh
    npm ls --global bower | grep -q bower
  EOC
  code <<-EOC
    . /etc/profile.d/nodejs.sh
    npm install --global bower
  EOC
end
