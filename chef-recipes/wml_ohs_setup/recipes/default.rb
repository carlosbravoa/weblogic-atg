#
# Cookbook Name:: wml_ohs_setup
# Recipe:: default
#
# Copyright 2016, cbravoa@gmail.com
#
# All rights reserved - Do Not Redistribute
#



# (1) Get the attributes from the Node object of the server recipe is run on # (Defined in attributes file)
os_user = node['linux_user']
os_installer_group = node['linux_group']
middleware_home = node['oracle_home']
domain_name = node['ohs_domain']
domains_path = node['ohs_domain_path']
instance_name = node['ohs_instance_name']
instance_admin_port = node['instance_admin_port']
instance_HTTP_Port = node['instance_HTTP_Port']
instance_HTTPS_Port = node['instance_HTTPS_Port']

#weblogic_home = "#{middleware_home}/wlserver"
#common_home = "#{middleware_home}/oracle_common"
#domains_path = File.join(middleware_home, "domains")

domain_py = File.join(middleware_home, "create_domain.py")

# (2) Create the WLS Dommains directory
directory domains_path do
  owner os_user
  group os_installer_group
  recursive true
  action :create
end

# (3) Create the WLST script to create the domain, passing in variables read from # the node's attribute hash map. Save the script to the server for execution
template domain_py do
  source "create_domain.py.erb"
  variables(
    instance_name: instance_name,
    instance_admin_port: instance_admin_port,
    instance_HTTP_Port: instance_HTTP_Port,
    instance_HTTPS_Port: instance_HTTPS_Port,
    domains_path: domains_path,
    domain_name: domain_name,
    middleware_home: middleware_home
  )
  owner os_user
  group os_installer_group
end

# (4) Run the WLST script to create the domain offline
ENV['ORACLE_HOME'] = middleware_home

execute "#{middleware_home}/ohs/common/bin/wlst.sh #{domain_py}" do
  environment "CONFIG_JVM_ARGS" => "-Djava.security.egd=file:/dev/./urandom"
  user os_user
  group os_installer_group
  action :run
  creates "#{domains_path}/#{domain_name}/config/config.xml"
end
