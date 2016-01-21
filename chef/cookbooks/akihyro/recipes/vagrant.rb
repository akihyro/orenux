#=======================================================================================================================
# akihyro: vagrant
#=======================================================================================================================

# プラグイン
[
  "dotenv",
  "vagrant-aws",
  "vagrant-ami",
  "vagrant-omnibus",
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
