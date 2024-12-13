Vagrant.configure("2") do |config|

  config.vm.define "web1" do |machine|
    config.vm.box = "ubuntu/bionic64"
  config.vm.box_version = "20230607.0.5"
    machine.vm.network "private_network", type: "static", ip: "192.168.79.121"
    config.vm.synced_folder "shared/", "/vagrant"
  
    machine.vm.disk :disk, size: "3GB", name: "sdc"
    machine.vm.disk :disk, size: "3GB", name: "sdd"
  
    machine.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--groups", "/Sistemas Críticos"]
      vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
      vb.cpus = 1
    end
  
    machine.vm.provision "shell", inline: <<-SHELL
        sudo hostnamectl set-hostname web1
        chmod +x /vagrant/*.sh
        bash /vagrant/install_update.sh
        bash /vagrant/install_raid.sh
        bash /vagrant/install_glusterfs_web.sh
        bash /vagrant/install_nginx.sh
        #(1) /vagrant/glusterfs_storage_volume.sh
        #(2) /vagrant/mount_gluster_web1.sh 
        sudo reboot
      SHELL
  
    end
  
  config.vm.define "web2" do |machine|
    config.vm.box = "ubuntu/bionic64"
  config.vm.box_version = "20230607.0.5"
    machine.vm.network "private_network", type: "static", ip: "192.168.79.122"
    config.vm.synced_folder "shared/", "/vagrant"
  
    machine.vm.disk :disk, size: "3GB", name: "sdc"
    machine.vm.disk :disk, size: "3GB", name: "sdd"
  
    machine.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--groups", "/Sistemas Críticos"]
      vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
      vb.cpus = 1
    end
  
    machine.vm.provision "shell", inline: <<-SHELL
        sudo hostnamectl set-hostname web2
        chmod +x /vagrant/*.sh
        bash /vagrant/install_update.sh
        bash /vagrant/install_raid.sh
        bash /vagrant/install_glusterfs_web.sh
        bash /vagrant/install_nginx.sh
        #(3) /vagrant/mount_gluster_web2.sh
        sudo reboot
      SHELL
  
  end
  
  config.vm.define "sql1" do |machine|
    config.vm.box = "ubuntu/bionic64"
    machine.vm.network "private_network", type: "static", ip: "192.168.79.111"
    config.vm.synced_folder "shared/", "/vagrant"

  
    machine.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--groups", "/Sistemas Críticos"]
      vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
      vb.cpus = 1
    end
  
    machine.vm.provision "shell", inline: <<-SHELL
        sudo hostnamectl set-hostname sql1
        chmod +x /vagrant/*.sh
        bash /vagrant/install_update.sh
        bash /vagrant/install_glusterfs_sql.sh
        #(4) bash /vagrant/mount_gluster_sql1.sh
        #(6) bash /vagrant/install_sql_mariadb.sh
        sudo reboot
      SHELL
  
  end


  config.vm.define "sql2" do |machine|
      config.vm.box = "ubuntu/bionic64"
      machine.vm.network "private_network", type: "static", ip: "192.168.79.112"
      config.vm.synced_folder "shared/", "/vagrant"
    
      machine.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--groups", "/Sistemas Críticos"]
        vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
        vb.cpus = 1
      end
    
      machine.vm.provision "shell", inline: <<-SHELL
          sudo hostnamectl set-hostname sql2
          chmod +x /vagrant/*.sh
          bash /vagrant/install_update.sh
          bash /vagrant/install_glusterfs_sql.sh
          #bash(5) /vagrant/mount_gluster_sql2.sh
          #bash(7) /vagrant/install_sql_mariadb.sh
        
          sudo reboot
        SHELL
  end
  

    config.vm.define "proxy1" do |machine|
      config.vm.box = "ubuntu/bionic64"
      machine.vm.network "private_network", type: "static", ip: "172.20.79.200"
      machine.vm.network "private_network", type: "static", ip: "192.168.79.100"
      config.vm.synced_folder "shared/", "/vagrant"
    
      machine.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--groups", "/Sistemas Críticos"]
        vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
        vb.cpus = 1
      end
    
      machine.vm.provision "shell", inline: <<-SHELL
          sudo hostnamectl set-hostname proxy1
          chmod +x /vagrant/*.sh
          bash /vagrant/install_update.sh
          bash /vagrant/install_haproxy.sh
          sudo reboot
        SHELL
  end

  config.vm.define "proxy2" do |machine|
    config.vm.box = "ubuntu/bionic64"
    machine.vm.network "private_network", type: "static", ip: "172.20.79.201"
    machine.vm.network "private_network", type: "static", ip: "192.168.79.101"
    config.vm.synced_folder "shared/", "/vagrant"
  
    machine.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--groups", "/Sistemas Críticos"]
      vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
      vb.cpus = 1
    end
  
    machine.vm.provision "shell", inline: <<-SHELL
        sudo hostnamectl set-hostname proxy2
        chmod +x /vagrant/*.sh
        bash /vagrant/install_update.sh
        bash /vagrant/install_haproxy.sh
        sudo reboot
      SHELL
end

config.vm.define "client" do |machine|
  config.vm.box = "ubuntu/bionic64"
  machine.vm.network "private_network", type: "static", ip: "172.20.79.10"
  config.vm.synced_folder "shared/", "/vagrant"

  machine.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--groups", "/Sistemas Críticos"]
    vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
  end

  machine.vm.provision "shell", inline: <<-SHELL
      sudo hostnamectl set-hostname client
      chmod +x /vagrant/*.sh
      bash /vagrant/install_update.sh
      bash /vagrant/install_gui.sh
      sudo reboot
    SHELL
end

        
end
