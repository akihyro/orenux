
remote_file '/tmp/remi-release-6.rpm' do
  source 'http://rpms.famillecollet.com/enterprise/remi-release-6.rpm'
  checksum 'caefe3e778f185535d80f21499dc50c5c388040e0966c96b539d8d05c907dc63'
end

package 'remi' do
  provider Chef::Provider::Package::Rpm
  source '/tmp/remi-release-6.rpm'
end

bash 'remi_disable' do
  only_if <<-EOC
    egrep -q 'enabled\\s*=\\s*1' /etc/yum.repos.d/remi.repo
  EOC
  code <<-EOC
    sed -i -e 's/enabled\\s*=\\s*1/enabled=0/g' /etc/yum.repos.d/remi.repo
  EOC
end
