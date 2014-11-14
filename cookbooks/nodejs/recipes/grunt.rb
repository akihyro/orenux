#=======================================================================================================================
# Node.js: Grunt
#=======================================================================================================================

# インストール
bash 'nodejs::grunt::install' do
  not_if <<-EOC
    . /etc/profile.d/nodejs.sh
    npm ls --global grunt-cli | grep -q grunt-cli
  EOC
  code <<-EOC
    . /etc/profile.d/nodejs.sh
    npm install --global grunt-cli
  EOC
end
