# This state downloads Katana and installs buildbot programs

# Note: Katana's branch here is only for testing the artifact server's port configuration
# It can be removed at a later date
Syncing Katana:
  git.latest:
    - name: https://github.com/Unity-Technologies/katana.git
    - target: /home/vagrant/shared-files/katana

Installing www:
  pip.installed:
    - name: www
    - cwd: /home/vagrant/shared-files/katana
    - editable: /home/vagrant/shared-files/katana/www
    - bin_env: /home/vagrant/pypysandbox
    - user: vagrant
Installing Master:
  pip.installed:
    - name: master
    - cwd: /home/vagrant/shared-files/katana
    - editable: /home/vagrant/shared-files/katana/master
    - process_dependency_links: True
    - bin_env: /home/vagrant/pypysandbox
    - user: vagrant
Installing Mock:
  pip.installed:
    - name: mock
    - cwd: /home/vagrant/shared-files/katana
    - bin_env: /home/vagrant/pypysandbox
    - user: vagrant
Installing Pyflakes:
  pip.installed:
    - name: pyflakes
    - cwd: /home/vagrant/shared-files/katana
    - bin_env: /home/vagrant/pypysandbox
    - user: vagrant
Installing Slave:
  pip.installed:
    - name: slave
    - cwd: /home/vagrant/shared-files/katana
    - editable: /home/vagrant/shared-files/katana/slave
    - bin_env: /home/vagrant/pypysandbox
    - user: vagrant

Creating builduser:
  cmd.run:
    - name: useradd builduser -m -d /home/builduser/ -p builduser; chmod 777 /home/builduser/

Create build slaves:
  cmd.run:
    - name: . /home/vagrant/pypysandbox/bin/activate; cd /home/vagrant/shared-files; buildslave create-slave  build-slave-01 localhost:9001 build-slave-01 builduser; buildslave create-slave  build-slave-02 localhost:9001 build-slave-02 builduser
