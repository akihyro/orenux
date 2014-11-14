#=======================================================================================================================
# akihyro: dotfiles
#=======================================================================================================================

# git 設定
template '/home/akihyro/.gitconfig' do
  owner 'akihyro'
  group 'akihyro'
  source 'dotfiles.gitconfig.erb'
end

# git 属性設定
template '/home/akihyro/.gitattributes' do
  owner 'akihyro'
  group 'akihyro'
  source 'dotfiles.gitattributes.erb'
end
