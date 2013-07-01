#
# Cookbook Name:: x11vnc
# Recipe:: default

package 'x11vnc'

package 'ssvnc'

=begin
service "x11vnc" do
  action [:enable, :start]
  provider Chef::Provider::Service::Upstart
end

password = node[:x11vnc][:password]

template '/etc/x11vnc.pass' do
  source 'x11vnc.pass.erb'
  mode '00644'
   variables(
    :password => password
  ) 
end 

password_opt = '-nopw'
unless node[:x11vnc][:password].empty?
  password_opt = '-rfbauth /etc/x11vnc.pass'

  execute 'gen x11vnc pw file' do
    command 'x11vnc -storepasswd /etc/x11vnc.pass'
  end
end

template "/etc/init/x11vnc.conf" do
  source "x11vnc.conf.erb"
  mode 00644
  variables(
    :password_opt => password_opt
  )
end
=end

directory '/data/vnc' do
  owner 'root'
  group 'root'
  mode 00644
  action :create
  recursive true
end

template '/data/vnc/vncserver' do
  source 'vncserver.erb'
  mode 00700
 #variables(
 #  :password_opt => password_opt
 #)
end

execute 'make executable' do
  command 'sudo chmod +x /data/vnc/vncserver'
end

=begin
execute 'start vncserver' do 
  command 'sudo /etc/init.d/vncserver start'
end

execute 'iptables' do
  command 'sudo iptables --flush'
end
=end
