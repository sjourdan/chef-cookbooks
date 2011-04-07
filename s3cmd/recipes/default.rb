# Cookbook Name:: s3cmd
# Recipe:: default

# http://s3tools.org/repositories#note-deb

execute "Add s3tools repository" do
  command "wget -O- -q http://s3tools.org/repo/deb-all/stable/s3tools.key | sudo apt-key add - ; wget -O/etc/apt/sources.list.d/s3tools.list http://s3tools.org/repo/deb-all/stable/s3tools.list"
  not_if do
    File.exists?("/etc/apt/sources.list.d/s3tools.list")
  end
end

package "s3cmd" do
  case node[:platform]
  when "debian","ubuntu"
    package_name "s3cmd"
  end
  action :upgrade
end

template "/root/.s3cfg" do
  source "s3cfg.erb"
  owner "root"
  group "root"
  mode 0644
end
