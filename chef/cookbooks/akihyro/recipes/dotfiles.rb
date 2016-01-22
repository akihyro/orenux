#=======================================================================================================================
# akihyro: dotfiles
#=======================================================================================================================

# ローカルリポジトリ
git "/home/akihyro/dotfiles" do
  action :checkout
  user "akihyro"
  group "akihyro"
  repository "git@github.com:akihyro/dotfiles.git"
  enable_checkout false
end

# インストール
bash "akihyro::dotfiles::install" do
  user "akihyro"
  group "akihyro"
  environment "HOME" => "/home/akihyro"
  code "/home/akihyro/dotfiles/install.sh"
  not_if "test -f /home/akihyro/.dotfiles"
end
