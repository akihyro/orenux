
directory '/vagrant/.orenux-cache/java'

bash '/vagrant/.orenux-cache/java/jdk-7u60-linux-x64.rpm' do
  not_if <<-EOC
    sha256sum /vagrant/.orenux-cache/java/jdk-7u60-linux-x64.rpm | grep -q '00bc3841127b4b569b78b07d1fb30bfe6bc483dfa72b3fa256c586a55386ed2e'
  EOC
  code <<-EOC
    curl -L -o /vagrant/.orenux-cache/java/jdk-7u60-linux-x64.rpm \
        -H 'Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com; oraclelicense=accept-securebackup-cookie' \
        'http://download.oracle.com/otn-pub/java/jdk/7u60-b19/jdk-7u60-linux-x64.rpm'
  EOC
end

rpm_package 'jdk-7u60' do
  source '/vagrant/.orenux-cache/java/jdk-7u60-linux-x64.rpm'
end
