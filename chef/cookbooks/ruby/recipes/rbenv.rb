#=======================================================================================================================
# Ruby: rbenv
#=======================================================================================================================

# ダウンロード
git "/opt/rbenv-1.0.0" do
  repository "https://github.com/rbenv/rbenv.git"
  revision "v1.0.0"
end

# プラグインディレクトリ
directory "/opt/rbenv-1.0.0/plugins"

# rbenv-update ダウンロード
git "/opt/rbenv-1.0.0/plugins/rbenv-update" do
  repository "https://github.com/rkh/rbenv-update.git"
  revision "1961fa180280bb50b64cbbffe6a5df7cf70f5e50"
end

# ruby-build ダウンロード
git "/opt/rbenv-1.0.0/plugins/ruby-build" do
  repository "https://github.com/rbenv/ruby-build.git"
  revision "v20160111"
end

# rbenv-gem-rehash ダウンロード
git "/opt/rbenv-1.0.0/plugins/rbenv-gem-rehash" do
  repository "https://github.com/rbenv/rbenv-gem-rehash.git"
  revision "v1.0.0"
end

# rbenv-default-gems ダウンロード
git "/opt/rbenv-1.0.0/plugins/rbenv-default-gems" do
  repository "https://github.com/rbenv/rbenv-default-gems.git"
  revision "4f68eae50c8afc3a476d0a904719262f61a4fb44"
end

# デフォルト gem
template "/opt/rbenv-1.0.0/default-gems" do
  source "rbenv.default-gems.erb"
end

# 環境設定
ruby_block "ruby::ruby::env" do
  block do
    ENV["RBENV_ROOT"] = "/opt/rbenv-1.0.0"
    ENV["PATH"] = "#{ENV['RBENV_ROOT']}/bin:#{ENV['PATH']}"
    ENV["PATH"] = "#{ENV['RBENV_ROOT']}/shims:#{ENV['PATH']}"
  end
  not_if { ENV["RBENV_ROOT"] == "/opt/rbenv-1.0.0" }
end
template "/etc/profile.d/rbenv.sh" do
  source "rbenv.rbenv.sh.erb"
end
