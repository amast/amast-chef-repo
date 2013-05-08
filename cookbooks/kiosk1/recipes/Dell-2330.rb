remote_file '/usr/local/src/compat-drivers-2013-03-28-5-u' do
  source 'https://www.kernel.org/pub/linux/kernel/projects/backports/2013/03/28/compat-drivers-2013-03-28-5-u.tar.bz2'
  owner 'root'
  group 'root'
  mode '0755'
end

#execute 'untar' do
# command 'tar -xjvf /usr/local/src/compat-drivers-2013-03-28-5-u.tar.bz2'
#end

bash 'install compat' do
  only_if 'ifconfig | grep eth0'
  user 'root'
  cwd '/tmp'
  code <<-EOH
    cd /usr/local/src/
    tar -xjvf ./compat-drivers-2013-03-28-5-u.tar.bz2
    cd ./compat-drivers-2013-03-28-5-u
    ./scripts/driver-select alx
    make && make install
    modprobe alx
  EOH
end

template '/etc/network/interfaces/' do
  source 'interfaces.erb'
  mode 0440
  owner 'root'
  group 'root'
end
