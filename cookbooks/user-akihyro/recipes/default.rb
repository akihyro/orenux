#=======================================================================================================================
# ユーザ: atsoba
#=======================================================================================================================

# ユーザ 作成
user 'akihyro' do
  password '$1$CnTsphAm$UlWV9IgO6gcX.WKJxDXz80'
  comment 'akihyro'
  supports :manage_home => true
end


# sudo 設定
template '/etc/sudoers.d/akihyro' do
  source 'sudoers.erb'
end


# git 設定
template '/home/akihyro/.gitconfig' do
  owner 'akihyro'
  group 'akihyro'
  source 'gitconfig.erb'
end

# git 属性 設定
template '/home/akihyro/.gitattributes' do
  owner 'akihyro'
  group 'akihyro'
  source 'gitattributes.erb'
end


# 自動ログイン 設定
file '/home/akihyro/.netrc' do
  owner 'akihyro'
  group 'akihyro'
  mode '0600'
  content IO.read('/win/home/.netrc')
end


# SSHディレクトリ 作成
directory '/home/akihyro/.ssh' do
  owner 'akihyro'
  group 'akihyro'
  mode '0700'
end

# SSH 設定
template '/home/akihyro/.ssh/config' do
  owner 'akihyro'
  group 'akihyro'
  source 'sshconfig.erb'
end

# SSH 既知ホスト 設定
file '/home/akihyro/.ssh/known_hosts' do
  owner 'akihyro'
  group 'akihyro'
  content IO.read('/win/home/.ssh/known_hosts')
end

# SSH GitHub 秘密鍵 作成
file "/home/akihyro/.ssh/github_rsa" do
  owner 'akihyro'
  group 'akihyro'
  mode '0600'
  content IO.read('/win/home/.ssh/github_rsa')
end

# SSH GitHub 公開鍵 作成
file "/home/akihyro/.ssh/github_rsa.pub" do
  owner 'akihyro'
  group 'akihyro'
  content IO.read('/win/home/.ssh/github_rsa.pub')
end


# Samba ユーザ 作成
bash 'user-akihyro_samba' do
  not_if <<-EOC
    pdbedit -L | egrep -q 'akihyro'
  EOC
  code <<-EOC
    echo '\n\n' | pdbedit -a -t akihyro
  EOC
end


# orenux ローカルリポジトリ（リンク） 作成
link '/home/akihyro/orenux' do
  owner 'akihyro'
  group 'akihyro'
  to '/vagrant'
end

# sublime-text-settings ローカルリポジトリ（リンク） 作成
link '/home/akihyro/sublime-text-settings' do
  owner 'akihyro'
  group 'akihyro'
  to '/win/home/AppData/Roaming/Sublime Text 3'
end

# rakugaki-box.net ローカルリポジトリ 作成
git '/home/akihyro/rakugaki-box.net' do
  action :checkout
  user 'akihyro'
  group 'akihyro'
  repository 'https://github.com/akihyro/rakugaki-box.net.git'
  enable_checkout false
end

# cloud-print-console ローカルリポジトリ 作成
git '/home/akihyro/cloud-print-console' do
  action :checkout
  user 'akihyro'
  group 'akihyro'
  repository 'https://github.com/akihyro/cloud-print-console.git'
  enable_checkout false
end

# try-rest-with-jaxrs ローカルリポジトリ 作成
git '/home/akihyro/try-rest-with-jaxrs' do
  action :checkout
  user 'akihyro'
  group 'akihyro'
  repository 'https://github.com/akihyro/try-rest-with-jaxrs.git'
  enable_checkout false
end
