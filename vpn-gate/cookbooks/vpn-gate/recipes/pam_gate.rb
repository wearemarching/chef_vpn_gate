#
# Cookbook Name:: vpn-gate 
# Recipe:: pam_gate 
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "git"
package "libcurl4-openssl-dev"
package "gcc"
package "make"
package "libpam0g-dev"

execute "get_pam_gate" do
    command "cd ~/ && git clone https://github.com/gate-sso/pam_gate.git"
end

execute "make_pam" do
    command "cd ~/pam_gate && make all"
end
