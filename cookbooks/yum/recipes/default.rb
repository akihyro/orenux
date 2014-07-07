
yum_package 'yum-plugin-fastestmirror'

bash 'yum_update' do
  code <<-EOC
    yum update -y
  EOC
end

remote_file '/tmp/epel-release-6-8.noarch.rpm' do
  source 'http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm'
end

rpm_package 'epel' do
  source '/tmp/epel-release-6-8.noarch.rpm'
end

bash 'yum_epel_disable' do
  only_if <<-EOC
    egrep -q 'enabled\\s*=\\s*1' /etc/yum.repos.d/epel.repo
  EOC
  code <<-EOC
    sed -i -e 's/enabled\\s*=\\s*1/enabled=0/g' /etc/yum.repos.d/epel.repo
  EOC
end

remote_file '/tmp/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm' do
  source 'http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm'
end

rpm_package 'rpmforge' do
  source '/tmp/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm'
end

bash 'yum_rpmforge_disable' do
  only_if <<-EOC
    egrep -q 'enabled\\s*=\\s*1' /etc/yum.repos.d/rpmforge.repo
  EOC
  code <<-EOC
    sed -i -e 's/enabled\\s*=\\s*1/enabled=0/g' /etc/yum.repos.d/rpmforge.repo
  EOC
end

remote_file '/tmp/ius-release-1.0-11.ius.centos6.noarch.rpm' do
  source 'http://dl.iuscommunity.org/pub/ius/stable/CentOS/6/x86_64/ius-release-1.0-11.ius.centos6.noarch.rpm'
end

rpm_package 'ius' do
  source '/tmp/ius-release-1.0-11.ius.centos6.noarch.rpm'
end

bash 'yum_ius_disable' do
  only_if <<-EOC
    egrep -q 'enabled\\s*=\\s*1' /etc/yum.repos.d/ius.repo
  EOC
  code <<-EOC
    sed -i -e 's/enabled\\s*=\\s*1/enabled=0/g' /etc/yum.repos.d/ius.repo
  EOC
end

remote_file '/tmp/remi-release-6.rpm' do
  source 'http://rpms.famillecollet.com/enterprise/remi-release-6.rpm'
end

rpm_package 'remi' do
  source '/tmp/remi-release-6.rpm'
end

bash 'yum_remi_disable' do
  only_if <<-EOC
    egrep -q 'enabled\\s*=\\s*1' /etc/yum.repos.d/remi.repo
  EOC
  code <<-EOC
    sed -i -e 's/enabled\\s*=\\s*1/enabled=0/g' /etc/yum.repos.d/remi.repo
  EOC
end
