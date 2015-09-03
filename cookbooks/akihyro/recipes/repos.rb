#=======================================================================================================================
# akihyro: リポジトリ
#=======================================================================================================================

# 俺俺 Linux 仮想環境
link '/home/akihyro/orenux' do
  owner 'akihyro'
  group 'akihyro'
  to '/vagrant'
end

# Sublime Text 3 Settings
link '/home/akihyro/sublime-text-settings' do
  owner 'akihyro'
  group 'akihyro'
  to '/host/home/AppData/Roaming/Sublime Text 3'
end

# rakugaki-box.net
git '/home/akihyro/rakugakibox.net' do
  action :checkout
  user 'akihyro'
  group 'akihyro'
  repository 'https://github.com/akihyro/rakugakibox.net.git'
  enable_checkout false
end

# Sync Walker
link '/home/akihyro/sync-walker' do
  owner 'akihyro'
  group 'akihyro'
  to '/host/home/sync-walker'
end
