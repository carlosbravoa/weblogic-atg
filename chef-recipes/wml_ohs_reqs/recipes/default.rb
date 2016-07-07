#
# Cookbook Name:: wml_ohs_reqs
# Recipe:: default
#
# Copyright 2016, cbravoa@gmail.com
#
# All rights reserved - Do Not Redistribute
#

package 'compat-libcap1' do
     action :install
end

package 'compat-libstdc++-33' do
     action :install
end

package 'libaio-devel' do
     action :install
end

package 'sysstat' do
     action :install
end

