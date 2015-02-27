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
    not_if <<-EOC
      su - akihyro -c 'vagrant plugin list' | egrep -q '^#{plugin} '
    EOC
    code <<-EOC
      su - akihyro -c 'vagrant plugin install #{plugin}'
    EOC
  end
end
