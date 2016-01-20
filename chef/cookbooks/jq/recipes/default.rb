#=======================================================================================================================
# jq
#=======================================================================================================================

# ディレクトリ
directory '/opt/jq-1.5/bin' do
  recursive true
end

# ダウンロード
remote_file '/opt/jq-1.5/bin/jq' do
  source 'https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64'
  checksum 'c6b3a7d7d3e7b70c6f51b706a3b90bd01833846c54d32ca32f0027f00226ff6d'
  mode '0755'
end

# 環境設定 (即時)
ruby_block 'jq::env' do
  not_if do
    ENV['JQ_HOME'] == '/opt/jq-1.5'
  end
  block do
    ENV['JQ_HOME'] = '/opt/jq-1.5'
    ENV['PATH'] = "#{ENV['JQ_HOME']}/bin:#{ENV['PATH']}"
  end
end

# 環境設定 (次回以降)
template '/etc/profile.d/jq.sh'
