# This state stops Katana. It can be called by running
#	salt-call state.apply stop

Stop buildmaster:
  cmd.run:
    - name: . /home/vagrant/pypysandbox/bin/activate; cd /home/vagrant/shared-files/testmaster; buildbot stop

Stop buildslaves:
  cmd.run:
    - name: . /home/vagrant/pypysandbox/bin/activate; cd /home/vagrant/shared-files; buildslave stop build-slave-01; buildslave stop build-slave-02;
