#=======================================================================================================================
# akihyro: dotfiles
#=======================================================================================================================

# ローカルリポジトリ
git '/home/akihyro/dotfiles' do
  action :checkout
  user 'akihyro'
  group 'akihyro'
  repository 'https://github.com/akihyro/dotfiles.git'
  enable_checkout false
end

# インストール
bash 'akihyro::dotfiles::install' do
  user 'akihyro'
  group 'akihyro'
  environment 'HOME' => '/home/akihyro'
  not_if <<-EOC
    test -f /home/akihyro/.dotfiles.installed
  EOC
  code <<-EOC
    /home/akihyro/dotfiles/install.sh
    touch /home/akihyro/.dotfiles.installed
  EOC
end
