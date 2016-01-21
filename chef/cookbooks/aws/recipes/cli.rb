#=======================================================================================================================
# AWS: CLI
#=======================================================================================================================

# ダウンロード
remote_file "#{Chef::Config[:file_cache_path]}/awscli-bundle.zip" do
  source "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip"
end

# 展開
bash "aws::cli::extract" do
  code "unzip #{Chef::Config[:file_cache_path]}/awscli-bundle.zip -d /opt/aws-cli"
  not_if "test -d /opt/aws-cli"
end

# インストール
bash "aws::cli::install" do
  cwd "/opt/aws-cli"
  code "awscli-bundle/install -i ${PWD}"
  not_if "test -d /opt/aws-cli/bin"
end

# 環境設定
ruby_block "aws::cli::env" do
  block do
    ENV["AWS_CLI_HOME"] = "/opt/aws-cli"
    ENV["PATH"] = "#{ENV['AWS_CLI_HOME']}/bin:#{ENV['PATH']}"
  end
  not_if { ENV["AWS_CLI_HOME"] == "/opt/aws-cli" }
end
template "/etc/profile.d/aws-cli.sh" do
  source "cli.aws-cli.sh.erb"
end
template "/etc/bash_completion.d/aws-cli" do
  source "cli.aws-cli-completion.sh.erb"
end
