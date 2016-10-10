Start autobahn (without printing output):
  cmd.run:
    - name: . /home/vagrant/pypysandbox/bin/activate; python /home/vagrant/shared-files/katana/autobahn/autobahnServer.py >/home/vagrant/shared-files/katana/autobahn/autobahnServer.log 2>&1 &

Print out log:
  cmd.run:
    - name: sleep 3; tail /home/vagrant/shared-files/katana/autobahn/autobahnServer.log
