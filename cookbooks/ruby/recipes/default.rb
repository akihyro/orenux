#=======================================================================================================================
# Ruby
#=======================================================================================================================

# キャッシュディレクトリ
directory '/vagrant/.orenux-cache/ruby'

# rbenv ダウンロード
git '/opt/rbenv-0.4.0' do
  repository 'https://github.com/sstephenson/rbenv.git'
  revision 'v0.4.0'
end

# rbenv プラグインディレクトリ 作成
directory '/opt/rbenv-0.4.0/plugins'

# ruby-build ダウンロード
git '/opt/rbenv-0.4.0/plugins/ruby-build' do
  repository 'https://github.com/sstephenson/ruby-build.git'
  revision 'v20140926'
end

# 環境変数設定
template '/etc/profile.d/rbenv.sh'


# Ruby 2.1.3 インストール
bash 'ruby_install_2.1.3' do
  not_if <<-EOC
    . /etc/profile.d/rbenv.sh
    rbenv versions | grep -q 2.1.3
  EOC
  code <<-EOC
    . /etc/profile.d/rbenv.sh
    rbenv install 2.1.3
  EOC
end

# Ruby 2.1.3 Bundler インストール
bash 'ruby_install_bundler' do
  not_if <<-EOC
    . /etc/profile.d/rbenv.sh
    rbenv shell 2.1.3
    gem list bundler | egrep -q '^bundler'
  EOC
  code <<-EOC
    . /etc/profile.d/rbenv.sh
    rbenv shell 2.1.3
    gem install bundler
  EOC
end


# グローバルバージョン 設定
bash 'ruby_global_2.1.3' do
  not_if <<-EOC
    . /etc/profile.d/rbenv.sh
    rbenv global | grep -q 2.1.3
  EOC
  code <<-EOC
    . /etc/profile.d/rbenv.sh
    rbenv global 2.1.3
  EOC
end
