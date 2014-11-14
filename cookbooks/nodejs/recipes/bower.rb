#=======================================================================================================================
# Node.js: Bower
#=======================================================================================================================

# インストール
bash 'nodejs::bower::install' do
  not_if <<-EOC
    . /etc/profile.d/nodejs.sh
    npm ls --global bower | grep -q bower
  EOC
  code <<-EOC
    . /etc/profile.d/nodejs.sh
    npm install --global bower
  EOC
end
