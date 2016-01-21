#=======================================================================================================================
# yum: パッケージ
#=======================================================================================================================

# インストール
yum_package "autoconf"
yum_package "bash-completion" do
  options "--enablerepo=epel"
end
yum_package "bind-utils"
yum_package "curl"
yum_package "dstat"
yum_package "expat"
yum_package "expat-devel"
yum_package "gcc"
yum_package "gcc-c++"
yum_package "gettext"
yum_package "gettext-devel"
yum_package "httpd-tools"
yum_package "kernel"
yum_package "kernel-devel"
yum_package "libaio"
yum_package "libaio-devel"
yum_package "libcurl-devel"
yum_package "libffi"
yum_package "libffi-devel"
yum_package "libxml2"
yum_package "libxml2-devel"
yum_package "libxslt"
yum_package "libxslt-devel"
yum_package "lv" do
  options "--enablerepo=rpmforge"
end
yum_package "openssh"
yum_package "openssh-clients"
yum_package "openssh-server"
yum_package "openssl"
yum_package "openssl-devel"
yum_package "patch"
yum_package "passwd"
yum_package "perl"
yum_package "perl-ExtUtils-MakeMaker"
yum_package "readline"
yum_package "readline-devel"
yum_package "rsync"
yum_package "sl" do
  options "--enablerepo=epel"
end
yum_package "sudo"
yum_package "tree"
yum_package "unzip"
yum_package "vim-enhanced"
yum_package "which"
yum_package "xz"
yum_package "xz-devel"
yum_package "zlib"
yum_package "zlib-devel"
