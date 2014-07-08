
directory '/vagrant/.orenux-cache/yum'

yum_package 'yum-plugin-fastestmirror'

bash 'yum_update' do
  code <<-EOC
    yum update -y
  EOC
end

remote_file '/vagrant/.orenux-cache/yum/epel-release-6-8.noarch.rpm' do
  source 'http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm'
  checksum 'e5ed9ecf22d0c4279e92075a64c757ad2b38049bcf5c16c4f2b75d5f6860dc0d'
end

rpm_package 'epel' do
  source '/vagrant/.orenux-cache/yum/epel-release-6-8.noarch.rpm'
end

bash 'yum_epel_disable' do
  only_if <<-EOC
    egrep -q 'enabled\\s*=\\s*1' /etc/yum.repos.d/epel.repo
  EOC
  code <<-EOC
    sed -i -e 's/enabled\\s*=\\s*1/enabled=0/g' /etc/yum.repos.d/epel.repo
  EOC
end

remote_file '/vagrant/.orenux-cache/yum/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm' do
  source 'http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm'
  checksum '1f98252908e397f70a216964ed836e93ba4e80550eac343586895a993a41afb7'
end

rpm_package 'rpmforge' do
  source '/vagrant/.orenux-cache/yum/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm'
end

bash 'yum_rpmforge_disable' do
  only_if <<-EOC
    egrep -q 'enabled\\s*=\\s*1' /etc/yum.repos.d/rpmforge.repo
  EOC
  code <<-EOC
    sed -i -e 's/enabled\\s*=\\s*1/enabled=0/g' /etc/yum.repos.d/rpmforge.repo
  EOC
end

remote_file '/vagrant/.orenux-cache/yum/ius-release-1.0-11.ius.centos6.noarch.rpm' do
  source 'http://dl.iuscommunity.org/pub/ius/stable/CentOS/6/x86_64/ius-release-1.0-11.ius.centos6.noarch.rpm'
  checksum '1b96aa2fa6b27dc7d02e23da69ef7c6da8da4476ec7d1c355df4361c5394fcb6'
end

rpm_package 'ius' do
  source '/vagrant/.orenux-cache/yum/ius-release-1.0-11.ius.centos6.noarch.rpm'
end

bash 'yum_ius_disable' do
  only_if <<-EOC
    egrep -q 'enabled\\s*=\\s*1' /etc/yum.repos.d/ius.repo
  EOC
  code <<-EOC
    sed -i -e 's/enabled\\s*=\\s*1/enabled=0/g' /etc/yum.repos.d/ius.repo
  EOC
end

remote_file '/vagrant/.orenux-cache/yum/remi-release-6.rpm' do
  source 'http://rpms.famillecollet.com/enterprise/remi-release-6.rpm'
  checksum 'caefe3e778f185535d80f21499dc50c5c388040e0966c96b539d8d05c907dc63'
end

rpm_package 'remi' do
  source '/vagrant/.orenux-cache/yum/remi-release-6.rpm'
end

bash 'yum_remi_disable' do
  only_if <<-EOC
    egrep -q 'enabled\\s*=\\s*1' /etc/yum.repos.d/remi.repo
  EOC
  code <<-EOC
    sed -i -e 's/enabled\\s*=\\s*1/enabled=0/g' /etc/yum.repos.d/remi.repo
  EOC
end
