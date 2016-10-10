# Katana Development Environment
This repository contains a development environment which uses Vagrant and Salt to run a local Katana server on a virtual machine. 


# Setup

1. Download and install Vagrant from the [Vagrant website](http://www.vagrantup.com).
2. Clone this repository to the directory of your choice.
3. In the terminal, navigate to the directory containing the `Vagrantfile`, and run the command `vagrant up`. Notes:
   * This performs first time setup for the virtual machine and may take a while.
   * Vagrant may ask you to install additional libraries or a VMM such as VirtualBox if you don't currently have one installed.
   * If Vagrant asks you to perform a `vagrant init` command, you are most likely in the wrong directory.
4. SSH into the Vagrant machine using `vagrant ssh`. On Windows it may prompt you for at passphrase, password combination; the passphrase is blank and the password is `vagrant`.
5. To allow build agents to connect to your Katana setup, you need to run

		python ~/shared-files/set_server_ip.py

	and specify the IP address of the computer running the virtual machine (also needed below).
6. Start the artifact server with

		sudo salt-call state.apply start-artifactserver

	You should now be able to connect to the artifact server on [http:/localhost:8002](http:/localhost:8002).
7. To allow the build agents to connect to the artifact server, we will have to generate a key-pair for the super-user on your Vagrant setup and place the public key
in the regular users `authorized_keys`file:

	1. Make sure you are running the following commands as the super-user by first running `sudo su`.
	2. Generate an SSH key-pair with `ssh-keygen` and skip all input prompts by hitting return.
	3. Copy the public key over with
			
			ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@<your ip> -p 2233
			
		The password is `vagrant`.
	4. Now check that you can actually connect with `ssh vagrant@<your ip> -p 2233`. It should now not prompt you for a password.
8. Start the Katana server running the sample configuration with

		sudo salt-call state.apply start
		
9. Login to the Katana server by going to [http:/localhost:8001](http:/localhost:8001) and logging in with username `user` and password `password`.

# Using the Development Environment

## Making Changes
Having run the setup above, Katana should be located in the folder `shared-files/katana`. Since all files in the `shared-files` folder are kept in sync inside and outside the VM, any changes
 you make to these files will register both places. After making your changes to Katana or a buildmaster, you can (re)start Katana in the Vagrant VM by running
 
	 sudo salt-call state.apply start
	 
### Auto Updating Front-end
*Note: this may not work with Windows machines.* </br>
To have frontend changes to Katana automatically affect the running Katana instance, do the following:
1. Run the front-end setup with
	
		sudo salt-call state.apply setup-frontend
		
2. Have Katana start watching for changes with

		cd ~shared-files/katana/www ; grunt
		
Now changes to Katanas HTML, CSS, or JavaScript should visible in the running instance (you may have to reload cache for the changes to appear). If you'd access the shell without stopping grunt,
 use `CTRL+$` followed by `bg` to keep it running in the background (`%` will surface it again).
## Salt States
The folder `shared-files/states` contains a collection of [salt](www.salt-stack.com) states which can be invoked with `sudo salt-call state.apply <state-name>` most of them are used during setup,
 but a couple are using during general workflow:
 
 * The following command (re)starts the slaves `build-slave-01` and `build-slave-02`as well as (re)starting and reconfiguring the included `testmaster` Katana instance. 
 
		sudo salt-call state.apply start
		
	You can alter this state to work with your own project, by pattern-matching and altering the `start.sls` file -- i.e. altering mentions of `testmaster` to `yourmaster` and/or 
	altering references to buildslaves.

 * Likewise, the slaves and the master can be stopped with
		
		sudo salt-call state.apply stop
		
 * Setup can be re-run with
		
		sudo salt-call state.apply setup
		
Any custom states can be added as `shared-files/states/<your_state>.sls` and invoked with

	sudo salt-call state.apply <your_state>

## Vagrant Commands

* Start the Vagrant VM with

		vagrant up
		
* SSH into the running Vagrant VM with

		vagrant ssh
		
* Pause the Vagrant VM, saving its state including running programs with

		vagrant suspend
		
* Stop the Vagrant VM with

		vagrant halt
		
* Delete the Vagrant VM along with all its contents with

		vagrant destroy
		
## The Terminal

The VM that Vagrant uses is running a Ubuntu Trusty Tahr Server (14.04) image, and as such the VM will use a bash shell.

If you are unfamiliar with a bash shell or similar,

* [UsingTheTerminal](https://help.ubuntu.com/community/UsingTheTerminal#Commands) has a basic rundown on how to use an Ubuntu terminal.
* [AptGet/Howto](https://help.ubuntu.com/community/AptGet/Howto) is a guide on how to use the Aptitude package manager `apt-get`to install packages on Ubuntu.
* [Learning the Shell](http://linuxcommand.org/lc3_learning_the_shell.php) and [Unix Tutorial](http://www.ee.surrey.ac.uk/Teaching/Unix/) give rundowns on terminal commands etc.

Other than that `CTRL+d` quits the Vagrant VM.

# Limitations

* Problems between Vagrant and SQLAlchemy mean that it is not possible to run a master using a SQLite database
 within the `shared-files`folder.
 Another consequence of this, is that if you wish to run the Katana unit-tests with `trial buildbot`, it must also be done from outside
 this folder.
