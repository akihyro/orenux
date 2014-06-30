
user 'akihyro' do
  password '$1$CnTsphAm$UlWV9IgO6gcX.WKJxDXz80'
  comment 'akihyro'
  supports :manage_home => true
end

template '/etc/sudoers.d/akihyro' do
  source 'sudoers.erb'
end
