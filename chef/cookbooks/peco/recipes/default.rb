#=======================================================================================================================
# peco
#=======================================================================================================================

# ダウンロード
resource_file_path = "#{Chef::Config[:file_cache_path]}/peco-0.3.5_linux_amd64.tar.gz"
remote_file resource_file_path do
  source "https://github.com/peco/peco/releases/download/v0.3.5/peco_linux_amd64.tar.gz"
end

# 展開
bash "peco::extract" do
  code <<-EOC
    tar -xz --no-same-owner --no-same-permissions -f #{resource_file_path} -C /opt
    mv /opt/peco_linux_amd64 /opt/peco-0.3.5
  EOC
  not_if "test -d /opt/peco-0.3.5"
end

# 環境設定
link "/usr/local/bin/peco" do
  to "/opt/peco-0.3.5/peco"
end
