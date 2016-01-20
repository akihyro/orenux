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

# Rakugaki BOX
git '/home/akihyro/rakugakibox.net' do
  action :checkout
  user 'akihyro'
  group 'akihyro'
  repository 'git@github.com:akihyro/rakugakibox.net.git'
  enable_checkout false
end

# SyncWalker
git '/home/akihyro/syncwalker' do
  action :checkout
  user 'akihyro'
  group 'akihyro'
  repository 'git@github.com:akihyro/syncwalker.git'
  enable_checkout false
end

# YamlResourceBundle
git '/home/akihyro/yaml-resource-bundle' do
  action :checkout
  user 'akihyro'
  group 'akihyro'
  repository 'git@github.com:akihyro/yaml-resource-bundle.git'
  enable_checkout false
end
