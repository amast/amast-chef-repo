#
# Cookbook Name:: getting-started-amast
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "#{ENV[ 'HOME' ]}/chef-getting-started.txt" do
	source "chef-getting-started.txt.erb"
	mode "0644"
end

