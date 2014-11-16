#=======================================================================================================================
# Ruby: Ruby
#=======================================================================================================================

# インストール
bash 'ruby::ruby::install' do
  not_if <<-EOC
    eval "$(rbenv init -)"
    rbenv versions | grep -q 2.1.5
  EOC
  code <<-EOC
    eval "$(rbenv init -)"
    rbenv install 2.1.5
  EOC
end

# Bundler インストール
bash 'ruby::ruby::install-bundler' do
  not_if <<-EOC
    eval "$(rbenv init -)"
    rbenv shell 2.1.5
    gem list bundler | egrep -q '^bundler'
  EOC
  code <<-EOC
    eval "$(rbenv init -)"
    rbenv shell 2.1.5
    gem install bundler
  EOC
end
