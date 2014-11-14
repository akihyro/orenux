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
bash 'redis::extract' do
  not_if <<-EOC
    test -d /opt/redis-2.8.6
  EOC
  code <<-EOC
    tar xfz /vagrant/.orenux-cache/redis/redis-2.8.6.tar.gz -C /opt
  EOC
end

# ビルド/インストール
bash 'redis::install' do
  not_if <<-EOC
    test -d /opt/redis-2.8.6/bin
  EOC
  code <<-EOC
    cd /opt/redis-2.8.6
    make
    make install PREFIX=/opt/redis-2.8.6
  EOC
end

# 環境設定 (即時)
ruby_block 'redis::env' do
  not_if do
    ENV['REDIS_HOME'] == '/opt/redis-2.8.6'
  end
  block do
    ENV['REDIS_HOME'] = '/opt/redis-2.8.6'
    ENV['PATH'] = "#{ENV['REDIS_HOME']}/bin:#{ENV['PATH']}"
  end
end

# 環境設定 (次回以降)
template '/etc/profile.d/redis.sh'
