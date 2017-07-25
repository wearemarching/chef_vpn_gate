#
# Cookbook Name:: vpn-gate 
# Recipe:: libnss-cache
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "git"

execute 'clone_libnss-cache' do
    command "cd ~/ && git clone https://github.com/gate-sso/libnss-cache.git"
end

execute 'make_libnss-cache' do
    command "cd ~/libnss-cache && make install"
end
