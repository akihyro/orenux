#=======================================================================================================================
# Ruby: rbenv
#=======================================================================================================================

# ダウンロード
git '/opt/rbenv-0.4.0' do
  repository 'https://github.com/sstephenson/rbenv.git'
  revision 'v0.4.0'
end

# プラグインディレクトリ
directory '/opt/rbenv-0.4.0/plugins'

# rbenv-update ダウンロード
git '/opt/rbenv-0.4.0/plugins/rbenv-update' do
  repository 'https://github.com/rkh/rbenv-update.git'
  revision 'f0ff6e3264c45fdf2a8064205db6c8b3a707894e'
end

# ruby-build ダウンロード
git '/opt/rbenv-0.4.0/plugins/ruby-build' do
  repository 'https://github.com/sstephenson/ruby-build.git'
  revision 'v20141113'
end

# rbenv-gem-rehash ダウンロード
git '/opt/rbenv-0.4.0/plugins/rbenv-gem-rehash' do
  repository 'https://github.com/sstephenson/rbenv-gem-rehash.git'
  revision 'v1.0.0'
end

# rbenv-default-gems ダウンロード
git '/opt/rbenv-0.4.0/plugins/rbenv-default-gems' do
  repository 'https://github.com/sstephenson/rbenv-default-gems.git'
  revision 'ead67889c91c53ad967f85f5a89d986fdb98f6fb'
end

# デフォルト gem
template '/opt/rbenv-0.4.0/default-gems' do
  source 'rbenv.default-gems.erb'
end

# 環境設定 (即時)
ruby_block 'ruby::rbenv::env' do
  not_if do
    ENV['RBENV_ROOT'] == '/opt/rbenv-0.4.0' && ENV['RUBY_BUILD_CACHE_PATH'] == '/vagrant/.orenux-cache/ruby'
  end
  block do
    ENV['RBENV_ROOT'] = '/opt/rbenv-0.4.0'
    ENV['PATH'] = "#{ENV['RBENV_ROOT']}/bin:#{ENV['PATH']}"
    ENV['RUBY_BUILD_CACHE_PATH'] = '/vagrant/.orenux-cache/ruby'
  end
end

# 環境設定 (次回以降)
template '/etc/profile.d/rbenv.sh' do
  source 'rbenv.rbenv.sh.erb'
end
