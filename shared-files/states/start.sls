# This state (re)starts Katana. It can be called by running
#	salt-call state.apply start

Stop currently running buildslaves:
  cmd.run:
    - name: . /home/vagrant/pypysandbox/bin/activate; cd /home/vagrant/shared-files; buildslave stop build-slave-01; buildslave stop build-slave-02;

Restart buildmaster:
  cmd.run:
    - name: . /home/vagrant/pypysandbox/bin/activate; cd /home/vagrant/shared-files/testmaster; buildbot stop; sleep 5; buildbot upgrade-master; buildbot start

Start buildslaves:
  cmd.run:
    - name: . /home/vagrant/pypysandbox/bin/activate; cd /home/vagrant/shared-files; buildslave start build-slave-01; buildslave start build-slave-02;
