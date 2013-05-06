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

apt_repository "chrome"   do
  uri "http://dl.google.com/linux/chrome/deb/"
  distribution "stable"
  components ["main"]
  key "https://dl-ssl.google.com/linux/linux_signing_key.pub"
  action :add
end

package "google-chrome-" + node['google-chrome']['track']

