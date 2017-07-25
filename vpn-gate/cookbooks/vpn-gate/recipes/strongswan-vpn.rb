#
# Cookbook Name:: vpn-gate 
# Recipe:: strongswan-vpn 
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node.packages.each do |pkg|
    package pkg
end

=begin
execute 'get_strongSwan-5.5.3' do
    command "wget http://download.strongswan.org/strongswan-5.5.3.tar.bz2 -P ~/"
end

execute 'extract_strongSwan-5.5.3' do
    command "tar xjvf ~/strongswan-5.5.3.tar.bz2 -C ~/"
end

execute 'remove_strongSwan-5.5.3' do
    command "rm ~/strongswan-5.5.3.tar.bz2"
end

execute 'configure_strongSwan' do
    command "cd ~/strongswan-5.5.3/ && ./configure -prefix=/usr --sysconfdir=/etc --enable-eap-gtc --enable-xauth-pam"
end

execute 'make_strongSwan' do
    command "cd ~/strongswan-5.5.3/ && make install"
end
=end

%w{ipsec.conf ipsec.secrets}.each do |fname|
    template "/etc/#{fname}" do
        source "default/ipsec-core/#{fname}.erb"
    end
end

template "/etc/strongswan.d/charon.conf" do
    source "default/ipsec-core/charon.conf.erb"
end

template "/etc/strongswan.d/charon/xauth-pam.conf" do
    source "default/ipsec-core/xauth-pam.conf.erb"
end

test = data_bag('strongswan-conf')

test.each do |haha|
    puts data_bag_item('strongswan-conf', haha)
end
