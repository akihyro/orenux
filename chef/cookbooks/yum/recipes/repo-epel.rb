#=======================================================================================================================
# yum: epel リポジトリ
#=======================================================================================================================

# インストール
yum_package "epel-release"

# 無効化
# ※利用時は "--enablerepo=epel" オプションを都度付与して有効化する。
bash "yum::repo-epel::disable" do
  only_if <<-EOC
    egrep -q "enabled\\s*=\\s*1" /etc/yum.repos.d/epel.repo
  EOC
  code <<-EOC
    sed -i -e "s/enabled\\s*=\\s*1/enabled=0/g" /etc/yum.repos.d/epel.repo
  EOC
end
