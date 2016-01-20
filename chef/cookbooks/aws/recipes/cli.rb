#=======================================================================================================================
# AWS: CLI
#=======================================================================================================================

# ダウンロード
remote_file '/vagrant/.orenux-cache/aws/awscli-bundle.zip' do
  source 'https://s3.amazonaws.com/aws-cli/awscli-bundle.zip'
end

# 展開
bash 'aws::cli::extract' do
  not_if <<-EOC
    test -d /vagrant/.orenux-cache/aws/awscli-bundle
  EOC
  code <<-EOC
    unzip '/vagrant/.orenux-cache/aws/awscli-bundle.zip' -d /vagrant/.orenux-cache/aws
  EOC
end

# インストール
bash 'aws::cli::install' do
  not_if <<-EOC
    test -f /opt/aws/bin/aws
  EOC
  code <<-EOC
    cd /vagrant/.orenux-cache/aws/awscli-bundle
    ./install -i /opt/aws
  EOC
end

# 環境設定 (即時)
ruby_block 'aws::cli::env' do
  not_if do
    ENV['AWS_HOME'] == '/opt/aws'
  end
  block do
    ENV['AWS_HOME'] = '/opt/aws'
    ENV['PATH'] = "#{ENV['AWS_HOME']}/bin:#{ENV['PATH']}"
  end
end

# 環境設定 (次回以降)
template '/etc/profile.d/aws-cli.sh' do
  source 'cli.aws-cli.sh.erb'
end
