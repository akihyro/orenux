#=======================================================================================================================
# Redis
#=======================================================================================================================

# キャッシュディレクトリ
directory '/vagrant/.orenux-cache/redis'

# ダウンロード
remote_file '/vagrant/.orenux-cache/redis/redis-2.8.6.tar.gz' do
  source 'http://download.redis.io/releases/redis-2.8.6.tar.gz'
  checksum 'efd0c9cb8d2696db44d8cb8309fed96607f68b93bb126615e64bff364e716658'
end

# 展開
bash 'redis_extract' do
  not_if <<-EOC
    test -d /opt/redis-2.8.6
  EOC
  code <<-EOC
    tar xfz /vagrant/.orenux-cache/redis/redis-2.8.6.tar.gz -C /opt
  EOC
end

# インストール
bash 'redis_install' do
  not_if <<-EOC
    test -d /opt/redis-2.8.6/bin
  EOC
  code <<-EOC
    cd /opt/redis-2.8.6
    make
    make install PREFIX=/opt/redis-2.8.6
  EOC
end

# サービス起動スクリプト 修正
# [utils/install_server.sh]
#   => そのままインストールすると chkconfig が上手く動かないので一部書き換える
#   => 参考: install.shがそのままでは動かないので修正する - kwyの日記
#            http://d.hatena.ne.jp/kwy/20130925/1380120686
bash 'redis_fix_service_script' do
  only_if <<-EOC
    egrep -q '!`which chkconfig`' /opt/redis-2.8.6/utils/install_server.sh
  EOC
  code <<-EOC
    sed -i -e 's/\!\`which chkconfig\`/\! \`which chkconfig\`/g' /opt/redis-2.8.6/utils/install_server.sh
  EOC
end

# 環境変数設定
template '/etc/profile.d/redis.sh'

# サービス起動
bash 'redis_service' do
  not_if <<-EOC
    test -f /etc/init.d/redis_6379
  EOC
  code <<-EOC
    . /etc/profile.d/redis.sh
    cd $REDIS_HOME/utils
    ./install_server.sh
  EOC
end
