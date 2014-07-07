
directory '/opt/hub'

remote_file '/opt/hub/hub' do
  source 'http://hub.github.com/standalone'
  checksum '8f066bc40ba15b5273c74ac2be73adcfe7b6ee1e54f0630d2fe746c0a4b4bf24'
  mode '0755'
end

template '/usr/local/bin/hub' do
  mode '0755'
end

template '/etc/profile.d/hub.alias.sh' do
  mode '0755'
end

remote_file '/opt/hub/hub.bash_completion.sh' do
  source 'https://raw.githubusercontent.com/github/hub/master/etc/hub.bash_completion.sh'
  checksum 'be03263ddeb86204eb87b6b26d320683e212ac47857e873a7ed0d242443180c0'
  mode '0755'
end

link '/etc/profile.d/hub.bash_completion.sh' do
  to '/opt/hub/hub.bash_completion.sh'
end
