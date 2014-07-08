
directory '/vagrant/.orenux-cache/hub'

directory '/opt/hub'

remote_file '/vagrant/.orenux-cache/hub/hub' do
  source 'http://hub.github.com/standalone'
  checksum '8f066bc40ba15b5273c74ac2be73adcfe7b6ee1e54f0630d2fe746c0a4b4bf24'
end

file '/opt/hub/hub' do
  content lazy { IO.read('/vagrant/.orenux-cache/hub/hub') }
  mode '0755'
end

template '/usr/local/bin/hub' do
  mode '0755'
end

template '/opt/hub/hub.alias.sh' do
  mode '0755'
end

link '/etc/profile.d/hub.alias.sh' do
  to '/opt/hub/hub.alias.sh'
end

remote_file '/vagrant/.orenux-cache/hub/hub.bash_completion.sh' do
  source 'https://raw.githubusercontent.com/github/hub/master/etc/hub.bash_completion.sh'
  checksum 'be03263ddeb86204eb87b6b26d320683e212ac47857e873a7ed0d242443180c0'
end

file '/opt/hub/hub.bash_completion.sh' do
  content lazy { IO.read('/vagrant/.orenux-cache/hub/hub.bash_completion.sh') }
  mode '0755'
end

link '/etc/profile.d/hub.bash_completion.sh' do
  to '/opt/hub/hub.bash_completion.sh'
end
