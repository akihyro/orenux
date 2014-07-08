
directory '/vagrant/.orenux-cache/peco'

remote_file '/vagrant/.orenux-cache/peco/peco_linux_amd64-0.1.12.tar.gz' do
  source 'https://github.com/peco/peco/releases/download/v0.1.12/peco_linux_amd64.tar.gz'
  checksum '5230d49140cb565a8678bf0a9718a441a58a4145dcdd45abfb855c5d16595d58'
end

bash 'peco_extract' do
  not_if <<-EOC
    test -f /opt/peco-0.1.12/peco
  EOC
  code <<-EOC
    tar xfz /vagrant/.orenux-cache/peco/peco_linux_amd64-0.1.12.tar.gz -C /opt
    mv /opt/peco_linux_amd64 /opt/peco-0.1.12
  EOC
end

link '/usr/local/bin/peco' do
  to '/opt/peco-0.1.12/peco'
end
