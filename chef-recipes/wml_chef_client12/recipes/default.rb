#
# Cookbook Name:: wml_chef_client12
# Recipe:: default
#
# Copyright 2016, WML
#
# All rights reserved - Do Not Redistribute
#

#hola

execute "download chef-client 12.11.18-1 from repo" do
    command "curl -O " + node['common_artifact_repo'] +"/chef-client/chef-12.11.18-1.el6.x86_64.rpm"
end

execute "instal via rpm" do
    command "sudo rpm -Uvh chef-12.11.18-1.el6.x86_64.rpm"
end

