
directory '/opt/hub'

remote_file '/opt/hub/hub' do
  source 'http://hub.github.com/standalone'
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

remote_file '/opt/hub/hub.bash_completion.sh' do
  source 'https://raw.githubusercontent.com/github/hub/master/etc/hub.bash_completion.sh'
  mode '0755'
end

link '/etc/profile.d/hub.bash_completion.sh' do
  to '/opt/hub/hub.bash_completion.sh'
end
