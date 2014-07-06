
git '/opt/rbenv-0.4.0' do
  repository 'https://github.com/sstephenson/rbenv.git'
  revision 'v0.4.0'
end

directory '/opt/rbenv-0.4.0/plugins'

git '/opt/rbenv-0.4.0/plugins/ruby-build' do
  repository 'https://github.com/sstephenson/ruby-build.git'
  revision 'v20140702'
end

template '/etc/profile.d/rbenv.sh'

bash 'rbenv_install_2.1.2' do
  not_if <<-EOC
    . /etc/profile.d/rbenv.sh
    rbenv versions | grep -q 2.1.2
  EOC
  code <<-EOC
    . /etc/profile.d/rbenv.sh
    rbenv install 2.1.2
  EOC
end

bash 'rbenv_global_2.1.2' do
  not_if <<-EOC
    . /etc/profile.d/rbenv.sh
    rbenv global | grep -q 2.1.2
  EOC
  code <<-EOC
    . /etc/profile.d/rbenv.sh
    rbenv global 2.1.2
  EOC
end
