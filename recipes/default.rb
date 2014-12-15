#
# Cookbook Name:: phpmysql
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

# Debug
log "MAESTRALOG" do
	level :info
	message "platform=#{node['platform']} | platform_version=#{node['platform_version'].to_f}"
end

# Install PHP-FPM
node.set_unless['php-fpm']['pools'] = []
include_recipe "php-fpm"

# Install PHP-MYSQL
include_recipe "php::module_mysql"

# Install NGINX
node.set['nginx']['default_site_enabled'] = false
include_recipe "nginx"

# Install MYSQL-CLIENT
include_recipe "mysql::client" unless platform_family?('windows') # No MySQL client on Windows