#=======================================================================================================================
# Java
#=======================================================================================================================

# ダウンロード
remote_file "#{Chef::Config[:file_cache_path]}/jdk-8u72-linux-x64.tar.gz" do
  source "http://download.oracle.com/otn-pub/java/jdk/8u72-b15/jdk-8u72-linux-x64.tar.gz"
  headers "Cookie" => "gpw_e24=http%3A%2F%2Fwww.oracle.com; oraclelicense=accept-securebackup-cookie"
end

# 展開
bash "java::extract" do
  code <<-EOC
    tar xfz #{Chef::Config[:file_cache_path]}/jdk-8u72-linux-x64.tar.gz -C /opt
    mv /opt/jdk1.8.0_72 /opt/jdk-1.8.0_72
  EOC
  not_if "test -d /opt/jdk-1.8.0_72"
end

# 環境設定
ruby_block "java::env" do
  block do
    ENV['JAVA_HOME'] = "/opt/jdk-1.8.0_72"
    ENV['PATH'] = "#{ENV['JAVA_HOME']}/bin:#{ENV['PATH']}"
  end
  not_if { ENV['JAVA_HOME'] == "/opt/jdk-1.8.0_72" }
end
template "/etc/profile.d/java.sh"
