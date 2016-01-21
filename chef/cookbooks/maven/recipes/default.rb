#=======================================================================================================================
# Maven
#=======================================================================================================================

# ダウンロード
remote_file "#{Chef::Config['file_cache_path']}/apache-maven-3.3.9-bin.tar.gz" do
  source "http://ftp.jaist.ac.jp/pub/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz"
end

# 展開
bash "maven::extract" do
  not_if "test -d /opt/maven-3.3.9"
  code <<-EOC
    tar xfz #{Chef::Config['file_cache_path']}/apache-maven-3.3.9-bin.tar.gz -C /opt
    mv /opt/apache-maven-3.3.9 /opt/maven-3.3.9
  EOC
end

# 環境設定
ruby_block "maven::env" do
  block do
    ENV["M2_HOME"] = "/opt/maven-3.3.9"
    ENV["PATH"] = "#{ENV['M2_HOME']}/bin:#{ENV['PATH']}"
  end
  not_if { ENV["M2_HOME"] == "/opt/maven-3.3.9" }
end
template "/etc/profile.d/maven.sh"
