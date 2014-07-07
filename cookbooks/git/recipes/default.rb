
yum_package 'git18' do
  options '--enablerepo=ius'
end

remote_file '/etc/profile.d/git-prompt.sh' do
  source 'https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh'
end

template '/etc/profile.d/ps1.sh'
