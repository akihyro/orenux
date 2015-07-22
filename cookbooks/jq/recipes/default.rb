#=======================================================================================================================
# jq
#=======================================================================================================================

# ディレクトリ
directory '/opt/jq/bin' do
  recursive true
end

# ダウンロード
remote_file '/opt/jq/bin/jq' do
  source  'http://stedolan.github.io/jq/download/linux64/jq'
  checksum 'b9b63aa4b3cc85df8bdca884effb69d66e9ebd717454a9e212d9423ffe3e955f'
  mode '0755'
end

# 環境設定 (即時)
ruby_block 'jq::env' do
  not_if do
    ENV['JQ_HOME'] == '/opt/jq'
  end
  block do
    ENV['JQ_HOME'] = '/opt/jq'
    ENV['PATH'] = "#{ENV['JQ_HOME']}/bin:#{ENV['PATH']}"
  end
end

# 環境設定 (次回以降)
template '/etc/profile.d/jq.sh'
