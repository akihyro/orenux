
link '/etc/localtime' do
  to '/usr/share/zoneinfo/Asia/Tokyo'
end

template '/etc/sysconfig/clock'
