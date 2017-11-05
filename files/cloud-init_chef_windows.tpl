#cloud-config
#package_upgrade: true


#TODO test windows
chef:
  install_type: omnibus
  #omnibus_url: "https://www.chef.io/chef/install.sh"
  #omnibus_version: "12.3.0"
  exec: true
  ssl_verify_mode: :verify_peer
  node_name: "${cm_hostname}"
  server_url: "${cm_master}"
  environment: "${environment}"
  validation_name: "${cm_client_name}"
  validation_key: "${replace(cm_client_key, "\n", "\\n")}"
  run_list:
    - "role[${cm_role}]"

 # Specify a list of initial attributes used by the cookbooks
  #initial_attributes:
  #  apache:
  #    prefork:
  #      maxclients: 100
  #    keepalive: "off"



# Capture all subprocess output into a logfile
# Useful for troubleshooting cloud-init issues
output: {all: '| tee -a /var/log/cloud-init-output.log'}