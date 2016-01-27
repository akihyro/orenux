#=======================================================================================================================
# Maven
#=======================================================================================================================

# ダウンロード
resource_file_path = "#{Chef::Config[:file_cache_path]}/apache-maven-3.3.9-bin.tar.gz"
remote_file resource_file_path do
  source "http://ftp.riken.jp/net/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz"
end

# 展開
bash "maven::extract" do
  not_if "test -d /opt/maven-3.3.9"
  code <<-EOC
    tar -xz --no-same-owner --no-same-permissions -f #{resource_file_path} -C /opt
    mv /opt/apache-maven-3.3.9 /opt/maven-3.3.9
  EOC
end

# 環境設定
ruby_block "maven::env" do
  block do
    ENV['M2_HOME'] = "/opt/maven-3.3.9"
    ENV['PATH'] = "#{ENV['M2_HOME']}/bin:#{ENV['PATH']}"
  end
  not_if { ENV['M2_HOME'] == "/opt/maven-3.3.9" }
end
template "/etc/profile.d/maven.sh"
