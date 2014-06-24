
remote_file '/tmp/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm' do
  source 'http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm'
  checksum '1f98252908e397f70a216964ed836e93ba4e80550eac343586895a993a41afb7'
end

package 'rpmforge' do
  provider Chef::Provider::Package::Rpm
  source '/tmp/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm'
end

bash 'rpmforge_disable' do
  only_if <<-EOC
    egrep -q 'enabled\\s*=\\s*1' /etc/yum.repos.d/rpmforge.repo
  EOC
  code <<-EOC
    sed -i -e 's/enabled\\s*=\\s*1/enabled=0/g' /etc/yum.repos.d/rpmforge.repo
  EOC
end
