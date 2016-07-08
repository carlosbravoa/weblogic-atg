# attribute files for ohs_setup recipe

default['linux_user'] = 'weblogic'
default['linux_group'] = 'weblogic_admin'
default['ohs_domain_path'] = '/home/'+ default['linux_user'] +'/OHS/user_projects/domains'
default['ohs_domain'] = 'ohs_domain'
default['oracle_home'] = '/home/'+ default['linux_user'] +'/OHS'
default['ohs_instance_name'] = 'ohs1'
default['instance_admin_port'] = '9999'
default['instance_HTTP_Port'] = '7777'
default['instance_HTTPS_Port'] = '44443'