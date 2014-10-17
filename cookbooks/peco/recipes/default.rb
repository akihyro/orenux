#=======================================================================================================================
# peco
#=======================================================================================================================

# キャッシュディレクトリ
directory '/vagrant/.orenux-cache/peco'

# ダウンロード
remote_file '/vagrant/.orenux-cache/peco/peco_linux_amd64-0.2.10.tar.gz' do
  source 'https://github.com/peco/peco/releases/download/v0.2.10/peco_linux_amd64.tar.gz'
  checksum '37655de0b602056ee8fadd2032cc483f8aa7a2de54a380ebc48e0bc3ec49e825'
end

# 展開
bash 'peco_extract' do
  not_if <<-EOC
    test -f /opt/peco-0.2.10/peco
  EOC
  code <<-EOC
    tar xfz /vagrant/.orenux-cache/peco/peco_linux_amd64-0.2.10.tar.gz -C /opt
    mv /opt/peco_linux_amd64 /opt/peco-0.2.10
  EOC
end

# パス
link '/usr/local/bin/peco' do
  to '/opt/peco-0.2.10/peco'
end
