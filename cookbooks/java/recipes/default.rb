
directory '/vagrant/.orenux-cache/java'

bash '/vagrant/.orenux-cache/java/jdk-7u65-linux-x64.rpm' do
  not_if <<-EOC
    sha256sum /vagrant/.orenux-cache/java/jdk-7u65-linux-x64.rpm | \
        grep -q '5aea4e14ab0d650c49267a53817df67320f7619b3e29722bab3715029dd9821c'
  EOC
  code <<-EOC
    curl -L -o /vagrant/.orenux-cache/java/jdk-7u65-linux-x64.rpm \
        -H 'Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com; oraclelicense=accept-securebackup-cookie' \
        'http://download.oracle.com/otn-pub/java/jdk/7u65-b17/jdk-7u65-linux-x64.rpm'
  EOC
end

rpm_package 'jdk-7u65' do
  source '/vagrant/.orenux-cache/java/jdk-7u65-linux-x64.rpm'
end
