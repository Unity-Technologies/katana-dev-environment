# This state sets up the initial sandbox that pip installs to and buildbot runs from
# The sandbox can be activated by running:
#	. ~/pypysandbox/bin/activate

Set up virtual environment:
  pkgrepo.managed:
    - ppa: pypy/ppa

  cmd.run:
    - name: apt-get update

  pkg.installed:
    - pkgs:
      - python-virtualenv: 1.11.4-1ubuntu1
      - pypy
      - pypy-dev

  virtualenv.managed:
    - name: /home/vagrant/pypysandbox
    - python: /usr/bin/pypy
    - user: vagrant

Make pypysandbox auto-activate on start:
  file.append:
    - name: /home/vagrant/.profile
    - text:
      - source /home/vagrant/pypysandbox/bin/activate
