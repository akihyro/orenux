#=======================================================================================================================
# akihyro: 鍵
#=======================================================================================================================

# 自動ログイン
file '/home/akihyro/.netrc' do
  owner 'akihyro'
  group 'akihyro'
  mode '0600'
  content IO.read('/host/home/.netrc')
end if File.file?('/host/home/.netrc')

# SSH ディレクトリ
directory '/home/akihyro/.ssh' do
  owner 'akihyro'
  group 'akihyro'
  mode '0700'
end

# SSH 設定
template '/home/akihyro/.ssh/config' do
  owner 'akihyro'
  group 'akihyro'
  mode '0644'
  source 'keys.ssh-config.erb'
end

# SSH 既知ホスト
template '/home/akihyro/.ssh/known_hosts' do
  owner 'akihyro'
  group 'akihyro'
  mode '0644'
  source 'keys.ssh-known_hosts.erb'
end

# SSH GitHub 秘密鍵
file '/home/akihyro/.ssh/github_rsa' do
  owner 'akihyro'
  group 'akihyro'
  mode '0600'
  content IO.read('/host/home/.ssh/github_rsa')
end if File.file?('/host/home/.ssh/github_rsa')

# SSH GitHub 公開鍵
file '/home/akihyro/.ssh/github_rsa.pub' do
  owner 'akihyro'
  group 'akihyro'
  mode '0644'
  content IO.read('/host/home/.ssh/github_rsa.pub')
end if File.file?('/host/home/.ssh/github_rsa.pub')
