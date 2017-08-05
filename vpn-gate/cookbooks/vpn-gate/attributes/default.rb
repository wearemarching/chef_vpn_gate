default['vpn']['leftid'] 	= "192.168.1.1"
default['vpn']['leftsubnet']	= "192.168.57.1/24"
default['vpn']['rightsourceip']	= "192.168.57.2/24"
default['vpn']['aggressive']	= true
default['vpn']['psk']		= "defaultpassword"
default['vpn']['pam_service']	= "common-auth"

default['nss_cache']['api_key']		= "defaultapikey"
default['nss_cache']['gate_host']	= "https://192.168.1.1/nss"

default['pam_gate']['auth_url'] = "https://localhost:2000"
default['pam_gate']['account_url'] = "https://localhost:2000"
