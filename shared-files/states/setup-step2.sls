# This state installs more packages and updates Pip

Install git/python/ruby:
  pkg.installed:
    - pkgs:
      - git #1:1.9.1-1ubuntu0.3
      - python-dev #2.7.5-5ubuntu3
      - ruby-dev #1:1.9.3.4

Update PIP:
  cmd:
    - run
    - name: . /home/vagrant/pypysandbox/bin/activate; pip install --upgrade setuptools; pip install --upgrade pip==7.1.0
