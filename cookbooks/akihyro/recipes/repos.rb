#=======================================================================================================================
# akihyro: リポジトリ
#=======================================================================================================================

# 俺用 Linux 仮想環境
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
git '/home/akihyro/rakugaki-box.net' do
  action :checkout
  user 'akihyro'
  group 'akihyro'
  repository 'https://github.com/akihyro/rakugaki-box.net.git'
  enable_checkout false
end

# Cloud Print Console
git '/home/akihyro/cloud-print-console' do
  action :checkout
  user 'akihyro'
  group 'akihyro'
  repository 'https://github.com/akihyro/cloud-print-console.git'
  enable_checkout false
end

# GlassFish4 + JAX-RS (Jersey) で REST なアプリを作ってみる
git '/home/akihyro/try-jaxrs' do
  action :checkout
  user 'akihyro'
  group 'akihyro'
  repository 'https://github.com/akihyro/try-jaxrs.git'
  enable_checkout false
end

# Spring Boot !!
git '/home/akihyro/try-spring-boot' do
  action :checkout
  user 'akihyro'
  group 'akihyro'
  repository 'https://github.com/akihyro/try-spring-boot.git'
  enable_checkout false
end

# VagrantでEC2インスタンスを構築してみる
git '/home/akihyro/try-vagrant-aws' do
  action :checkout
  user 'akihyro'
  group 'akihyro'
  repository 'https://github.com/akihyro/try-vagrant-aws.git'
  enable_checkout false
end
