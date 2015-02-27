#=======================================================================================================================
# akihyro: vagrant
#=======================================================================================================================

# プラグイン
[
  'dotenv',
  'vagrant-aws',
  'vagrant-ami',
  'vagrant-omnibus',
].each do |plugin|
  bash "akihyro::vagrant::#{plugin}" do
    user 'akihyro'
    group 'akihyro'
    environment 'HOME' => '/home/akihyro'
    not_if <<-EOC,
      vagrant plugin list | egrep -q '^#{plugin} '
    EOC
      :user => 'akihyro',
      :group => 'akihyro',
      :environment => { 'HOME' => '/home/akihyro' }
    code <<-EOC
      vagrant plugin install #{plugin}
    EOC
  end
end
