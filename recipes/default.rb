node[:rvm][:dependencies].each do |package_name|

  package package_name do
    action :install
    not_if "rpm -q #{package_name}"
  end

end

node[:rvm][:users].each do |rvm_user|

  home_dir = Dir.home(rvm_user[:user])
  env = {
    'USER' => rvm_user[:user],
    'HOME' => home_dir
  }

  rvm_dir = "#{home_dir}/.rvm"
  if rvm_user[:user] == 'root' then
    rvm_dir = "/usr/local/rvm"
  end
  
  rvm_bin = "#{rvm_dir}/bin/rvm"

  bash "Installing rvm on #{rvm_user[:user]}" do
    code "curl -Lk #{node[:rvm][:installer_url]} | bash -s stable"
    user rvm_user[:user]
    environment env
    not_if "[ -d #{rvm_dir} ]"
  end

  rvm_user[:rubies].each do |ruby|

    bash "Installing Ruby #{ruby} on #{rvm_user[:user]}" do
      code %{
        #{rvm_bin} install #{ruby}
      }
      environment env
      only_if "[ $(#{node[:rvm_bin]} list | grep -c #{ruby}) -eq 0 ]"
    end

  end

  bash "Set default ruby on #{rvm_user[:user]}" do
    code "#{rvm_bin} --default user #{rvm_user[:default]}"
    user rvm_user[:user]
    environment env
    not_if "[ -e #{rvm_dir}/bin/ruby ]"
  end

end

