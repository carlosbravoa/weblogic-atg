#
# Cookbook Name:: wml_ohs_reqs_repo
# Recipe:: default
#
# Copyright 2016, cbravoa@gmail.com
#
# All rights reserved - Do Not Redistribute
#

node['rpm_libs'].each do |dep|
  #download
  #install rpm -ivh dep

  remote_file "#{Chef::Config[:file_cache_path]}/#{dep}" do
    source node['common_artifact_repo'] + "/rhlet7rpms/" + dep
    action :create
	end

	rpm_package "#{dep}" do
	    source "#{Chef::Config[:file_cache_path]}/#{dep}"
	    action :install
	end
end