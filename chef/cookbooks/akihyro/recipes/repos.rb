#=======================================================================================================================
# akihyro: リポジトリ
#=======================================================================================================================

# 俺俺 Linux 環境
link "/home/akihyro/orenux" do
  owner "akihyro"
  group "akihyro"
  to "/vagrant"
end

# Sublime Text 3 Settings
link "/home/akihyro/sublime-text-settings" do
  owner "akihyro"
  group "akihyro"
  to "/host/home/AppData/Roaming/Sublime Text 3"
end

# rakugakibox.net
git "/home/akihyro/rakugakibox.net" do
  action :checkout
  user "akihyro"
  group "akihyro"
  repository "git@github.com:akihyro/rakugakibox.net.git"
  enable_checkout false
end
