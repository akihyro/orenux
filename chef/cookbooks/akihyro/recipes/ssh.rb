#=======================================================================================================================
# akihyro: SSH
#=======================================================================================================================

# ディレクトリ
directory "/home/akihyro/.ssh" do
  owner "akihyro"
  group "akihyro"
  mode "0700"
end

# 設定
template "/home/akihyro/.ssh/config" do
  owner "akihyro"
  group "akihyro"
  mode "0644"
  source "ssh.config.erb"
end

# GitHub アクセスキー
file "/home/akihyro/.ssh/github.com" do
  owner "akihyro"
  group "akihyro"
  mode "0600"
  sensitive true
  content IO.read("/host/home/.ssh/github.com")
end
