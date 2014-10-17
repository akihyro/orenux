
directory '/vagrant/.orenux-cache/nodejs'

remote_file '/vagrant/.orenux-cache/nodejs/node-v0.10.31-linux-x64.tar.gz' do
  source 'http://nodejs.org/dist/v0.10.31/node-v0.10.31-linux-x64.tar.gz'
  checksum '493aa5d4fac0f34df01b07c7d276f1da8d5139df82374c599ab932e740d52147'
end

bash 'nodejs_extract' do
  not_if <<-EOC
    test -d /opt/nodejs-0.10.31
  EOC
  code <<-EOC
    tar xfz /vagrant/.orenux-cache/nodejs/node-v0.10.31-linux-x64.tar.gz -C /opt
    mv /opt/node-v0.10.31-linux-x64 /opt/nodejs-0.10.31
  EOC
end

template '/etc/profile.d/nodejs.sh'

bash 'npm_install_grunt' do
  not_if <<-EOC
    npm ls --global grunt-cli | grep grunt-cli
  EOC
  code <<-EOC
    npm install --global grunt-cli
  EOC
end

bash 'npm_install_bower' do
  not_if <<-EOC
    npm ls --global bower | grep bower
  EOC
  code <<-EOC
    npm install --global bower
  EOC
end