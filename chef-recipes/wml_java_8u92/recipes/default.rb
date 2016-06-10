#
# Cookbook Name:: wml_java_8u92
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# TODO: make configurable in the attributes the java version and file

execute "download java from repo" do
    command "curl -O " + node['common_artifact_repo'] + "/oracle/java/1.8.0_92/jdk-8u92-linux-x64.rpm"
end

execute "instal via rpm" do
    command "sudo rpm -Uvh jdk-8u92-linux-x64.rpm"
end

