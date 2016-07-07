#
# Cookbook Name:: wml_ohs_install
# Recipe:: default
#
# Copyright 2016, cbravoa@gmail.com
#
# All rights reserved - Do Not Redistribute
#

#create silent file from template
#property :silent_file, String, default: 'silent.rsp'
#property :cache_path, String, default: lazy { Chef::Config[:file_cache_path]}
#property :silent_path, String, default: lazy { ::File.join(cache_path, silent_file) }

silent_file = 'silent.rsp'
cache_path = Chef::Config[:file_cache_path]
silent_path = ::File.join(cache_path, silent_file)
ohs_file_path = ::File.join(cache_path, node['installer_filename'])

template silent_path do
  mode 00644
  owner node['linux_user']
  group node['linux_group']
  source silent_file + '.erb'
  cookbook 'wml_ohs_install'
  variables(
    home: node['oracle_home']
  )
end

remote_file ohs_file_path do 
  source node['common_artifact_repo'] + "/oracle/ohs/" + node['installer_filename']
  owner node['linux_user']
  group node['linux_group']
  mode '0755'
  action :create
end

#install

execute "install_OHS" do
  user node['linux_user']
  group node['linux_group']
  command "#{ohs_file_path} -silent -responseFile #{silent_path}"
end