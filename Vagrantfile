# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |vagrant|
  vagrant.vm.define 'issues-backend' do |config|
    # Base box: Ubuntu 14.04 LTS Cloud Image
    config.vm.box = 'ubuntu/trusty64'

    # Host name
    config.vm.host_name = 'issues-backend.dev'

    # Provision via shell
    config.vm.provision 'shell', path: 'scripts/provision/bootstrap.sh', keep_color: true

    config.vm.provider 'virtualbox' do |vb|
      host = RbConfig::CONFIG['host_os']

      # Customize machine resources based on host HW
      # * http://www.stefanwrobel.com/how-to-make-vagrant-performance-not-suck
      # Give VM 1/4 system memory & access to all cpu cores on the host
      if host =~ /darwin/
        cpus = `sysctl -n hw.ncpu`.to_i
        # sysctl returns Bytes and we need to convert to MB
        mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 4
      elsif host =~ /linux/
        cpus = `nproc`.to_i
        # meminfo shows KB and we need to convert to MB
        mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024 / 4
      else # sorry Windows folks, I can't help you
        cpus = 2
        mem  = 2048
      end

      vb.customize ['modifyvm', :id, '--memory', mem]
      vb.customize ['modifyvm', :id, '--cpus', cpus]
    end

    # Networking
    config.vm.network 'private_network', ip: '192.168.50.10'

    # Synced folders
    config.vm.synced_folder '.', '/backend', type: 'nfs', mount_options: ['nolock,vers=3,udp']
    config.vm.synced_folder '.', '/vagrant', disabled: true

    # Port forwarding
    config.vm.network :forwarded_port, guest: 80,   host: 8080 # HTTP
    config.vm.network :forwarded_port, guest: 1080, host: 1080 # Mailcatcher
    config.vm.network :forwarded_port, guest: 3000, host: 3000 # Default Rails server
  end
end