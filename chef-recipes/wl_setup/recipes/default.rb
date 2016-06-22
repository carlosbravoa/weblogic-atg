#
# Cookbook Name:: wl_setup_test
# Recipe:: default
#
# 
#
# All rights reserved - Do Not Redistribute
#
# ref: http://blog.c2b2.co.uk/2015/03/installing-weblogic-with-chef.html
# edit environment file
# upload env file to chef
# associate env to node


# (1) Get the attributes from the Node object of the server recipe is run on # (Defined in environment)
os_user = node['weblogic']['os_user']
os_installer_group = node['weblogic']['os_installer_group']
middleware_home = node['weblogic']['oracle_home']
weblogic_home = "#{middleware_home}/wlserver"
common_home = "#{middleware_home}/oracle_common"
domains_path = File.join(middleware_home, "domains")
domain_name = node['wls_domain']['name']
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
domain_mode: node['wls_domain']['mode'],
domains_path: domains_path,
domain: domain_name,
start_mode: node['wls_domain']['start_mode'],
crossdomain_enabled: node['wls_domain']['crossdomain_enabled'],
username: node['wls_domain']['admin_username'],
password: node['wls_domain']['admin_password'],
wl_home: weblogic_home,
machines: node['wls_domain']['machines'],
admin_server: node['wls_domain']['admin_server'],
managed_servers: node['wls_domain']['managed_servers'],
clusters: node['wls_domain']['clusters']
)
owner os_user
group os_installer_group
end

# (4) Run the WLST script to create the domain offline
ENV['ORACLE_HOME'] = middleware_home

execute "#{weblogic_home}/common/bin/wlst.sh #{domain_py}" do
environment "CONFIG_JVM_ARGS" => "-Djava.security.egd=file:/dev/./urandom"
user os_user
group os_installer_group
action :run
creates "#{domains_path}/#{domain_name}/config/config.xml"
end
