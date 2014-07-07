
yum_package 'git18' do
  options '--enablerepo=ius'
end

remote_file '/etc/profile.d/git-prompt.sh' do
  source 'https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh'
  checksum '1665591b64eefe3cd0804c938ed3e112fe93ecb04094e247fe60099f3afeab1b'
end

template '/etc/profile.d/ps1.sh'
