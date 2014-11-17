#=======================================================================================================================
# Redis: サービス
#=======================================================================================================================

# サービスインストールスクリプト 修正
# [utils/install_server.sh]
#   => そのままインストールすると chkconfig が上手く動かないので一部書き換える
#   => 参考: install.shがそのままでは動かないので修正する - kwyの日記
#            http://d.hatena.ne.jp/kwy/20130925/1380120686
bash 'redis::service::fix-script' do
  only_if <<-EOC
    egrep -q '!`which chkconfig`' /opt/redis-2.8.6/utils/install_server.sh
  EOC
  code <<-EOC
    sed -i -e 's/\!\`which chkconfig\`/\! \`which chkconfig\`/g' /opt/redis-2.8.6/utils/install_server.sh
  EOC
end

# サービスインストール
bash 'redis::service::install' do
  not_if <<-EOC
    test -f /etc/init.d/redis_6379
  EOC
  code <<-EOC
    cd $REDIS_HOME/utils
    ./install_server.sh
  EOC
end
