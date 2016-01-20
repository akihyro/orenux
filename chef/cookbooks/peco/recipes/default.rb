#=======================================================================================================================
# peco
#=======================================================================================================================

# キャッシュディレクトリ
directory '/vagrant/.orenux-cache/peco'

# ダウンロード
remote_file '/vagrant/.orenux-cache/peco/peco_linux_amd64-0.3.3.tar.gz' do
  source 'https://github.com/peco/peco/releases/download/v0.3.3/peco_linux_amd64.tar.gz'
  checksum '90728c44afbf63fe38cbdc54f6953c2d4187844288fb9a85f1ecd5c273e4ec94'
end

# 展開
bash 'peco::extract' do
  not_if <<-EOC
    test -d /opt/peco-0.3.3
  EOC
  code <<-EOC
    tar xfz /vagrant/.orenux-cache/peco/peco_linux_amd64-0.3.3.tar.gz -C /opt
    mv /opt/peco_linux_amd64 /opt/peco-0.3.3
  EOC
end

# 環境設定
link '/usr/local/bin/peco' do
  to '/opt/peco-0.3.3/peco'
end
