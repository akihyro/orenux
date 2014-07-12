
yum_package 'samba'

service 'smb' do
  action [:enable, :start]
end

template '/etc/samba/smb.conf' do
  notifies :restart, "service[smb]"
end
