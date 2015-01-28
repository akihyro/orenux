#=======================================================================================================================
# Git
#=======================================================================================================================

# キャッシュディレクトリ
directory '/vagrant/.orenux-cache/git'

# ダウンロード
remote_file '/vagrant/.orenux-cache/git/git-2.2.2.tar.gz' do
  source 'https://github.com/git/git/archive/v2.2.2.tar.gz'
  checksum 'b265b6c6a48f85c71f46fca61fd05c25fee86ccc13152f054e57c0a5c6b78a7b'
end

# 展開
bash 'git::extract' do
  not_if <<-EOC
    test -d /opt/git-2.2.2
  EOC
  code <<-EOC
    tar xfz /vagrant/.orenux-cache/git/git-2.2.2.tar.gz -C /opt
  EOC
end

# ビルド/インストール
bash 'git::install' do
  not_if <<-EOC
    test -d /opt/git-2.2.2/bin
  EOC
  code <<-EOC
    cd /opt/git-2.2.2
    make configure
    ./configure --prefix=/opt/git-2.2.2
    make all
    make install
  EOC
end

# 環境設定 (即時)
ruby_block 'git::env' do
  not_if do
    ENV['GIT_HOME'] == '/opt/git-2.2.2'
  end
  block do
    ENV['GIT_HOME'] = '/opt/git-2.2.2'
    ENV['PATH'] = "#{ENV['GIT_HOME']}/bin:#{ENV['PATH']}"
  end
end

# 環境設定 (次回以降)
template '/etc/profile.d/git.sh'

# プロンプト
link '/etc/profile.d/git-prompt.sh' do
  to '/opt/git-2.2.2/contrib/completion/git-prompt.sh'
end

# コマンド補完
link '/etc/bash_completion.d/git' do
  to '/opt/git-2.2.2/contrib/completion/git-completion.bash'
end
