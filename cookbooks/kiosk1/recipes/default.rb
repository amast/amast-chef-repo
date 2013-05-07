#
# Cookbook Name:: kiosk1
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

package 'xorg' do
  action :install
end

package 'slim' do
  action :install
end

package 'openbox' do
  action :install
end

package 'make' do
  action :install
end

package 'build-essential' do
  action  :install
end

remote_file '/usr/local/src/google-chrome-stable_current_amd64.deb' do
  source 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
  owner 'root'
  group 'root'
  mode '0755'
end

dpkg_package "google-chrome" do
  source '/usr/local/src/google-chrome-stable_current_amd64.deb'
  action :install
end

