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

# ruby-build ダウンロード
git '/opt/rbenv-0.4.0/plugins/ruby-build' do
  repository 'https://github.com/sstephenson/ruby-build.git'
  revision 'v20141113'
end

# 環境設定 (即時)
ruby_block 'ruby::rbenv::env' do
  not_if do
    ENV['RBENV_ROOT'] == '/opt/rbenv-0.4.0'
  end
  block do
    ENV['RBENV_ROOT'] = '/opt/rbenv-0.4.0'
    ENV['PATH'] = "#{ENV['RBENV_ROOT']}/bin:#{ENV['PATH']}"
  end
end

# 環境設定 (次回以降)
template '/etc/profile.d/rbenv.sh' do
  source 'rbenv.rbenv.sh.erb'
end
