#=======================================================================================================================
# jq
#=======================================================================================================================

# ディレクトリ
directory "/opt/jq-1.5/bin" do
  recursive true
end

# ダウンロード
remote_file "/opt/jq-1.5/bin/jq" do
  source "https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64"
  mode "0755"
end

# 環境設定
ruby_block "jq::env" do
  block do
    ENV["JQ_HOME"] = "/opt/jq-1.5"
    ENV["PATH"] = "#{ENV['JQ_HOME']}/bin:#{ENV['PATH']}"
  end
  not_if { ENV["JQ_HOME"] == "/opt/jq-1.5" }
end
template "/etc/profile.d/jq.sh"
