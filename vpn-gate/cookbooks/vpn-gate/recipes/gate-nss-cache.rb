#
# Cookbook Name:: vpn-gate 
# Recipe:: gate-nss-cache
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "git"
package "golang-go"

execute 'clone_libnss-cache' do
    command "cd ~/ && git clone https://github.com/gate-sso/gate-nss-cache.git"
end

if ENV["GOPATH"] == nil
    execute 'create_go_path' do
        command "mkdir /usr/local/etc/code && mkdir /usr/local/etc/code/go"
    end
    ENV["GOPATH"] = "/usr/local/etc/code/go"
end

execute 'get_go_dependencies' do
    command "go get gopkg.in/yaml.v2"
end

execute 'create_nss_configuration' do
    command "mkdir /etc/nss/"
end

template "/etc/nss/nss_http.yml" do
    source "default/gate-nss-cache-core/nss_http.yml.erb"
end

template "/etc/nsswitch.conf" do
    source "default/gate-nss-cache-core/nsswitch.conf.erb"
end

