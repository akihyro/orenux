
directory '/vagrant/.orenux-cache/java'

bash '/vagrant/.orenux-cache/java/jdk-7u67-linux-x64.tar.gz' do
  not_if <<-EOC
    sha256sum /vagrant/.orenux-cache/java/jdk-7u67-linux-x64.tar.gz | \
        grep -q '54dd1e13edf18c64941a55da9c91210b53dc5cf48f1a8f4538c863049e346335'
  EOC
  code <<-EOC
    curl -L -o /vagrant/.orenux-cache/java/jdk-7u67-linux-x64.tar.gz \
        -H 'Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com; oraclelicense=accept-securebackup-cookie' \
        'http://download.oracle.com/otn-pub/java/jdk/7u67-b01/jdk-7u67-linux-x64.tar.gz'
  EOC
end

bash 'java7_extract' do
  not_if <<-EOC
    test -d /opt/jdk-1.7.0_67
  EOC
  code <<-EOC
    tar xfz /vagrant/.orenux-cache/java/jdk-7u67-linux-x64.tar.gz -C /opt
    mv /opt/jdk1.7.0_67 /opt/jdk-1.7.0_67
  EOC
end

bash '/vagrant/.orenux-cache/java/jdk-8u11-linux-x64.tar.gz' do
  not_if <<-EOC
    sha256sum /vagrant/.orenux-cache/java/jdk-8u11-linux-x64.tar.gz | \
        grep -q 'f3593b248b64cc53bf191f45b92a1f10e8c5099c2f84bd5bd5d6465dfd07a8e9'
  EOC
  code <<-EOC
    curl -L -o /vagrant/.orenux-cache/java/jdk-8u11-linux-x64.tar.gz \
        -H 'Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com; oraclelicense=accept-securebackup-cookie' \
        'http://download.oracle.com/otn-pub/java/jdk/8u11-b12/jdk-8u11-linux-x64.tar.gz'
  EOC
end

bash 'java8_extract' do
  not_if <<-EOC
    test -d /opt/jdk-1.8.0_11
  EOC
  code <<-EOC
    tar xfz /vagrant/.orenux-cache/java/jdk-8u11-linux-x64.tar.gz -C /opt
    mv /opt/jdk1.8.0_11 /opt/jdk-1.8.0_11
  EOC
end

template '/etc/profile.d/java.sh'
