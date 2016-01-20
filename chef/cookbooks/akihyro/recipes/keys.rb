#=======================================================================================================================
# akihyro: 鍵
#=======================================================================================================================

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
  source 'keys.config.erb'
end

# SSH GitHub 秘密鍵
file '/home/akihyro/.ssh/github' do
  owner 'akihyro'
  group 'akihyro'
  mode '0600'
  content IO.read('/host/home/.ssh/github')
end

# SSH GitHub 公開鍵
file '/home/akihyro/.ssh/github.pub' do
  owner 'akihyro'
  group 'akihyro'
  mode '0644'
  content IO.read('/host/home/.ssh/github.pub')
end
