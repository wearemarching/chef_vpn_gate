#
# Cookbook Name:: vpn-gate 
# Recipe:: gate-nss-cache
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "git"

execute 'create_nss_configuration' do
    command "mkdir /etc/nss/"
end

template "/etc/nss/nss_http.yml" do
    source "default/gate-nss-cache-core/nss_http.yml.erb"
end

template "/etc/nsswitch.conf" do
    source "default/gate-nss-cache-core/nsswitch.conf.erb"
end

cookbook_file "/bin/gate-nss-cache" do
    source "gate-nss-cache"
    owner "root"
    group "root"
    mode  "0755"
end

cron 'adding cron for gate nss cache ' do
    minute '*/5'
    command %W{
        GATE_CONFIG_FILE="/etc/gate/nss.yml"
        /bin/gate-nss-cache
    }.join(' ')
end

