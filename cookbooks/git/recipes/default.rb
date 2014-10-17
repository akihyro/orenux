#=======================================================================================================================
# git
#=======================================================================================================================

# インストール
yum_package 'git18' do
  options '--enablerepo=ius'
end

# git-prompt セットアップ
link '/etc/profile.d/git-prompt.sh' do
  to '/usr/share/git-core/contrib/completion/git-prompt.sh'
end
