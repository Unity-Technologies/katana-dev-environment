# This state (re)starts Katana. It can be called by running
#	salt-call state.apply start

Stop currently running pollers:
  cmd.run:
    - name: . /home/vagrant/pypysandbox/bin/activate; cd /home/vagrant/shared-files/buildmasterpoller; buildbot stop; cd /home/vagrant/shared-files/buildmasterpoller-unity; buildbot stop; cd /home/vagrant/shared-files/buildmasterpoller-gfx-tests-data; buildbot stop;

Upgrade pollers:
  cmd.run:
    - name: . /home/vagrant/pypysandbox/bin/activate; cd /home/vagrant/shared-files/buildmasterpoller; buildbot upgrade-master; cd /home/vagrant/shared-files/buildmasterpoller-unity; buildbot upgrade-master; cd /home/vagrant/shared-files/buildmasterpoller-gfx-tests-data; buildbot upgrade-master 

Start pollers:
  cmd.run:
    - name: . /home/vagrant/pypysandbox/bin/activate; cd /home/vagrant/shared-files/buildmasterpoller; buildbot start; cd /home/vagrant/shared-files/buildmasterpoller-unity; buildbot start; cd /home/vagrant/shared-files/buildmasterpoller-gfx-tests-data; buildbot start
