
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
