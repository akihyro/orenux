
remote_file '/tmp/ius-release-1.0-11.ius.centos6.noarch.rpm' do
  source 'http://dl.iuscommunity.org/pub/ius/stable/CentOS/6/x86_64/ius-release-1.0-11.ius.centos6.noarch.rpm'
  checksum 'ce752a9694a2f2096baab71b377514d6b1f72c01ababef255b4371bd56b803bd'
end

package 'ius' do
  provider Chef::Provider::Package::Rpm
  source '/tmp/ius-release-1.0-11.ius.centos6.noarch.rpm'
end

bash 'ius_disable' do
  only_if <<-EOC
    egrep -q 'enabled\\s*=\\s*1' /etc/yum.repos.d/ius.repo
  EOC
  code <<-EOC
    sed -i -e 's/enabled\\s*=\\s*1/enabled=0/g' /etc/yum.repos.d/ius.repo
  EOC
end
