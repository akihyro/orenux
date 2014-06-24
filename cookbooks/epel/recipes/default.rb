
remote_file '/tmp/epel-release-6-8.noarch.rpm' do
  source 'http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm'
  checksum 'e5ed9ecf22d0c4279e92075a64c757ad2b38049bcf5c16c4f2b75d5f6860dc0d'
end

package 'epel' do
  provider Chef::Provider::Package::Rpm
  source '/tmp/epel-release-6-8.noarch.rpm'
end

bash 'epel_disable' do
  only_if <<-EOC
    egrep -q 'enabled\\s*=\\s*1' /etc/yum.repos.d/epel.repo
  EOC
  code <<-EOC
    sed -i -e 's/enabled\\s*=\\s*1/enabled=0/g' /etc/yum.repos.d/epel.repo
  EOC
end
