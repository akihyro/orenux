
directory '/vagrant/.orenux-cache/glassfish'

remote_file '/vagrant/.orenux-cache/glassfish/glassfish-4.0.zip' do
  source 'http://download.java.net/glassfish/4.0/release/glassfish-4.0.zip'
  checksum 'fb85badd2cffa4fce4a325f153466af87e47bb75cd6a8126b67d4c1fbdaf0131'
end

bash 'glassfish_extract' do
  not_if <<-EOC
    test -d /opt/glassfish-4.0
  EOC
  code <<-EOC
    unzip -q -d /opt /vagrant/.orenux-cache/glassfish/glassfish-4.0.zip
    mv /opt/glassfish4 /opt/glassfish-4.0
  EOC
end
