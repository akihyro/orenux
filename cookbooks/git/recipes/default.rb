#=======================================================================================================================
# Git
#=======================================================================================================================

# キャッシュディレクトリ
directory '/vagrant/.orenux-cache/git'

# ダウンロード
remote_file '/vagrant/.orenux-cache/git/git-2.4.6.tar.gz' do
  source 'https://github.com/git/git/archive/v2.4.6.tar.gz'
  checksum '33b2f07f38d2c3e11d9b1575b6529f3081ea66dae7fa1c6d8a7b77ad38d2543a'
end

# 展開
bash 'git::extract' do
  not_if <<-EOC
    test -d /opt/git-2.4.6
  EOC
  code <<-EOC
    tar xfz /vagrant/.orenux-cache/git/git-2.4.6.tar.gz -C /opt
  EOC
end

# ビルド/インストール
bash 'git::install' do
  not_if <<-EOC
    test -d /opt/git-2.4.6/bin
  EOC
  code <<-EOC
    cd /opt/git-2.4.6
    make configure
    ./configure --prefix=/opt/git-2.4.6
    make all
    make install
  EOC
end

# 環境設定 (即時)
ruby_block 'git::env' do
  not_if do
    ENV['GIT_HOME'] == '/opt/git-2.4.6'
  end
  block do
    ENV['GIT_HOME'] = '/opt/git-2.4.6'
    ENV['PATH'] = "#{ENV['GIT_HOME']}/bin:#{ENV['PATH']}"
  end
end

# 環境設定 (次回以降)
template '/etc/profile.d/git.sh'

# プロンプト
link '/etc/profile.d/git-prompt.sh' do
  to '/opt/git-2.4.6/contrib/completion/git-prompt.sh'
end

# コマンド補完
link '/etc/bash_completion.d/git' do
  to '/opt/git-2.4.6/contrib/completion/git-completion.bash'
end
