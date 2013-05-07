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

#chrome dependencies
package 'libasound2' do
  action :install
end

package 'libgconf2-4' do
  action :install
end

package 'libnspr4' do
  action :install
end

package 'libnss3-1d' do
  action :install
end

package 'libxss1' do
  action :install
end

package 'xdg-utils' do
  action :install
end

remote_file '/usr/local/src/google-chrome-stable_current_amd64.deb' do
  source 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
  owner 'root'
  group 'root'
  mode '0755'
end

execute 'google-chrome' do
  command 'dpkg -i /usr/local/src/google-chrome-stable_current_amd64.deb'
end

execute 'default browser' do
  command 'update-alternatives --install /usr/bin/x-www-browser \x-www-browser /usr/bin/google-chrome'
end

user 'kiosk' do
  home '/home/kiosk'
  shell '/bin/bash'
end

execute 'password' do
  command 'passwd kiosk'
end
