current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "amast"
client_key               "#{current_dir}/amast.pem"
validation_client_name   "amast-home-validator"
validation_key           "#{current_dir}/amast-home-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/amast-home"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
