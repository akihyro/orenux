#=======================================================================================================================
# Ruby: Ruby
#=======================================================================================================================

# インストール
bash 'ruby::ruby::install' do
  not_if <<-EOC
    rbenv versions | grep -q 2.1.5
  EOC
  code <<-EOC
    rbenv install 2.1.5
  EOC
end

# Bundler インストール
bash 'ruby::ruby::install-bundler' do
  not_if <<-EOC
    rbenv shell 2.1.5
    rbenv exec gem list bundler | egrep -q '^bundler'
  EOC
  code <<-EOC
    rbenv shell 2.1.5
    rbenv exec gem install bundler
  EOC
end
