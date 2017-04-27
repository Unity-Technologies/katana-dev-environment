  Vagrant.configure("2") do |config|
    ## Choose your base box
    config.vm.define "ubuntutest" do |ubuntutest|
      ubuntutest.vm.hostname = "ubuntutest"
      ubuntutest.vm.box = "trusty-server"
      ubuntutest.vm.box_url = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box"
    end

    config.vm.provider "virtualbox" do |v|
      v.memory = 4098
      v.cpus = 2
    end

    ## For masterless, mount your salt file root
    config.vm.synced_folder "shared-files/", "/home/vagrant/shared-files/"

	# Open HTML port for Katana
    config.vm.network "forwarded_port", guest: 8001, host: 8001
	# Open HTML port for Artifact Server
    config.vm.network "forwarded_port", guest: 80, host: 8002
	# Open Autobahn port
    config.vm.network "forwarded_port", guest: 8010, host: 8010
	# Open Buildslave port
    config.vm.network "forwarded_port", guest: 9901, host: 9901
	# Open alternative SSH port (eg: for artifact settings)
    config.vm.network "forwarded_port", guest: 22, host: 2233

    ## Use all the defaults:
    config.vm.provision :salt do |salt|

      salt.masterless = true
      salt.minion_config = "minion-config"
      salt.run_highstate = true

    end
  end
