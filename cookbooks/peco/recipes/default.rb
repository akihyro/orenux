#=======================================================================================================================
# peco
#=======================================================================================================================

# キャッシュディレクトリ
directory '/vagrant/.orenux-cache/peco'

# ダウンロード
remote_file '/vagrant/.orenux-cache/peco/peco_linux_amd64-0.2.11.tar.gz' do
  source 'https://github.com/peco/peco/releases/download/v0.2.11/peco_linux_amd64.tar.gz'
  checksum '706f389ed6d43a5904dd75488e2d4f2901745583d5a1c6becfc0387f12588c4e'
end

# 展開
bash 'peco::extract' do
  not_if <<-EOC
    test -d /opt/peco-0.2.11
  EOC
  code <<-EOC
    tar xfz /vagrant/.orenux-cache/peco/peco_linux_amd64-0.2.11.tar.gz -C /opt
    mv /opt/peco_linux_amd64 /opt/peco-0.2.11
  EOC
end

# 環境設定
link '/usr/local/bin/peco' do
  to '/opt/peco-0.2.11/peco'
end
