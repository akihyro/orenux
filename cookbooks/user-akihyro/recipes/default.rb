
user 'akihyro' do
  password '$1$CnTsphAm$UlWV9IgO6gcX.WKJxDXz80'
  comment 'akihyro'
  supports :manage_home => true
end

template '/etc/sudoers.d/akihyro' do
  source 'sudoers.erb'
end

template '/home/akihyro/.gitconfig' do
  owner 'akihyro'
  group 'akihyro'
  source 'gitconfig.erb'
end

template '/home/akihyro/.gitattributes' do
  owner 'akihyro'
  group 'akihyro'
  source 'gitattributes.erb'
end

directory '/home/akihyro/.ssh' do
  owner 'akihyro'
  group 'akihyro'
  mode '0700'
end

template '/home/akihyro/.ssh/config' do
  owner 'akihyro'
  group 'akihyro'
  source 'sshconfig.erb'
end

file '/home/akihyro/.ssh/known_hosts' do
  owner 'akihyro'
  group 'akihyro'
  content IO.read('/win/home/.ssh/known_hosts')
end

file "/home/akihyro/.ssh/github_rsa" do
  owner 'akihyro'
  group 'akihyro'
  mode '0600'
  content IO.read('/win/home/.ssh/github_rsa')
end

file "/home/akihyro/.ssh/github_rsa.pub" do
  owner 'akihyro'
  group 'akihyro'
  content IO.read('/win/home/.ssh/github_rsa.pub')
end

bash 'user-akihyro_samba' do
  not_if <<-EOC
    pdbedit -L | egrep -q 'akihyro'
  EOC
  code <<-EOC
    echo '\n\n' | pdbedit -a -t akihyro
  EOC
end

link '/home/akihyro/orenux' do
  owner 'akihyro'
  group 'akihyro'
  to '/vagrant'
end

link '/home/akihyro/sublime-text-settings' do
  owner 'akihyro'
  group 'akihyro'
  to '/win/home/AppData/Roaming/Sublime Text 3'
end

git '/home/akihyro/cloud-print-console' do
  user 'akihyro'
  group 'akihyro'
  repository 'git@github.com:akihyro/cloud-print-console.git'
  enable_checkout false
  action :checkout
end

git '/home/akihyro/try-rest-with-jaxrs' do
  user 'akihyro'
  group 'akihyro'
  repository 'git@github.com:akihyro/try-rest-with-jaxrs.git'
  enable_checkout false
  action :checkout
end
