# This state runs Katana's buildbot and buildslave tests. It can be called by running
#	sudo salt-call state.apply update-Katana

Run buildbot tests:
  cmd.run:
    - name: . /home/vagrant/pypysandbox/bin/activate; trial buildbot.test

Run buildslave tests:
  cmd.run:
    - name: . /home/vagrant/pypysandbox/bin/activate; trial buildslave.test
