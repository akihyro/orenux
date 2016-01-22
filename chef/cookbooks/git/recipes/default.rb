#=======================================================================================================================
# Git
#=======================================================================================================================

# ダウンロード
resource_file_path = "#{Chef::Config[:file_cache_path]}/git-2.7.0.tar.gz"
remote_file resource_file_path do
  source "https://github.com/git/git/archive/v2.7.0.tar.gz"
end

# 展開
bash "git::extract" do
  code "tar -xz --no-same-owner --no-same-permissions -f #{resource_file_path} -C /opt"
  not_if "test -d /opt/git-2.7.0"
end

# ビルド/インストール
bash "git::install" do
  cwd "/opt/git-2.7.0"
  code <<-EOC
    make configure
    ./configure --prefix=${PWD}
    make all
    make install
  EOC
  not_if "test -d /opt/git-2.7.0/bin"
end

# 環境設定
ruby_block "git::env" do
  block do
    ENV['GIT_HOME'] = "/opt/git-2.7.0"
    ENV['PATH'] = "#{ENV['GIT_HOME']}/bin:#{ENV['PATH']}"
  end
  not_if { ENV['GIT_HOME'] == "/opt/git-2.7.0" }
end
template "/etc/profile.d/git.sh"
link "/etc/profile.d/git-prompt.sh" do
  to "/opt/git-2.7.0/contrib/completion/git-prompt.sh"
end
link "/etc/bash_completion.d/git" do
  to "/opt/git-2.7.0/contrib/completion/git-completion.bash"
end
