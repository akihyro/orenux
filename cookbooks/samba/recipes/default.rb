
yum_package 'samba'

service 'smb' do
  action [:enable, :start]
end
