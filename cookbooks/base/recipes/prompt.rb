#=======================================================================================================================
# Base: プロンプト
#=======================================================================================================================

# 設定
template '/etc/profile.d/prompt.sh' do
  source 'prompt.prompt.sh.erb'
end
