#=======================================================================================================================
# Node.js
#=======================================================================================================================

# ダウンロード
resource_file_path = "#{Chef::Config[:file_cache_path]}/node-v4.2.5-linux-x64.tar.xz"
remote_file resource_file_path do
  source "https://nodejs.org/dist/v4.2.5/node-v4.2.5-linux-x64.tar.xz"
end

# 展開
bash "nodejs::extract" do
  not_if "test -d /opt/nodejs-4.2.5"
  code <<-EOC
    tar -xJ --no-same-owner --no-same-permissions -f #{resource_file_path} -C /opt
    mv /opt/node-v4.2.5-linux-x64 /opt/nodejs-4.2.5
  EOC
end

# 環境設定
ruby_block "nodejs::env" do
  block do
    ENV['NODEJS_HOME'] = "/opt/nodejs-4.2.5"
    ENV['PATH'] = "#{ENV['NODEJS_HOME']}/bin:#{ENV['PATH']}"
  end
  not_if { ENV['NODEJS_HOME'] == "/opt/nodejs-4.2.5" }
end
template "/etc/profile.d/nodejs.sh"
