#=======================================================================================================================
# akihyro: Vagrant
#=======================================================================================================================

# プラグイン
[
  "vagrant-aws",
  "vagrant-ami",
].each do |plugin|
  bash "akihyro::vagrant::#{plugin}" do
    user "akihyro"
    group "akihyro"
    environment "HOME" => "/home/akihyro"
    code "vagrant plugin install #{plugin}"
    not_if "vagrant plugin list | egrep -q '^#{plugin} '",
      :user => "akihyro",
      :group => "akihyro",
      :environment => { "HOME" => "/home/akihyro" }
  end
end
