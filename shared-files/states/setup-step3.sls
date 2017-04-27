# This state installs MySQL files and creates an empty database

Install MySQL and others:
  pkg.installed:
    - pkgs:
      - mysql-server #5.5.49-0ubuntu0.14.04.1
      - libmysqlclient-dev #5.5.49-0ubuntu0.14.04.1
      - libsasl2-dev #2.1.25.dfsg1-17build1
      - libldap2-dev #2.4.31-1+nmu2ubuntu8.2
      - libssl-dev #1.0.1f-1ubuntu2.19
    
Set package permissions:
  cmd.run:
    - name: chown -R vagrant:vagrant /home/vagrant/pypysandbox

Setting up mysql database:
  service.running:
    - name: mysql
  mysql_user.present:
    - name: myuser
    - host: localhost
    - password: mypassword
  mysql_database.present:
    - name: katana-dev
    - character_set: utf8
  mysql_grants.present:
    - grant: all privileges
    - database: katana-dev.*
    - user: myuser
    - host: localhost

