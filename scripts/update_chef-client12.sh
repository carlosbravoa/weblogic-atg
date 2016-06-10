#!/usr/bin/env bash

#obtener del repo el rpm
curl -O http://192.168.33.251/chef-client/chef-12.11.18-1.el6.x86_64.rpm

#instalarlo
sudo rpm -Uvh chef-12.11.18-1.el6.x86_64.rpm
