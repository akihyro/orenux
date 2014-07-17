
directory '/vagrant/.orenux-cache/glassfish'

remote_file '/vagrant/.orenux-cache/glassfish/glassfish-4.0.1-b08-ml.zip' do
  source 'http://dlc.sun.com.edgesuite.net/glassfish/4.0.1/promoted/glassfish-4.0.1-b08-ml.zip'
  checksum '1bdecd7cb26a4aa66bfce73106247dc1bb0d02f8e81045f58ec72b3f3938731a'
end

bash 'glassfish_extract' do
  not_if <<-EOC
    test -d /opt/glassfish-4.0.1-b08-ml
  EOC
  code <<-EOC
    unzip -q -d /opt /vagrant/.orenux-cache/glassfish/glassfish-4.0.1-b08-ml.zip
    mv /opt/glassfish4 /opt/glassfish-4.0.1-b08-ml
  EOC
end

template '/etc/profile.d/glassfish.sh'
