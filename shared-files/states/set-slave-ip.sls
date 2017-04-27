#Set the IP that Slaves use to connect to the Master. Should be the IP of the host machine
Set Master-Slave IP:
  cmd.run:
    - name: cd /home/vagrant/shared-files/scripts; python set_server_ip.py {{ pillar['host_ip'] }}