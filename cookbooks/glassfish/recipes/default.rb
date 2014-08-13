
directory '/vagrant/.orenux-cache/glassfish'

remote_file '/vagrant/.orenux-cache/glassfish/glassfish-4.0.1-b10.zip' do
  source 'http://dlc.sun.com.edgesuite.net/glassfish/4.0.1/promoted/glassfish-4.0.1-b10.zip'
  checksum '11f9440739cd96aad9f0032152718682afdc69c4ce817210f8e74a106ae9a20d'
end

bash 'glassfish_extract' do
  not_if <<-EOC
    test -d /opt/glassfish-4.0.1-b10
  EOC
  code <<-EOC
    unzip -q -d /opt /vagrant/.orenux-cache/glassfish/glassfish-4.0.1-b10.zip
    mv /opt/glassfish4 /opt/glassfish-4.0.1-b10
  EOC
end

template '/etc/profile.d/glassfish.sh'
