Reconfigure buildmaster:
  cmd.run:
    - name: . /home/vagrant/pypysandbox/bin/activate; cd shared-files/buildmaster; buildbot reconfig
