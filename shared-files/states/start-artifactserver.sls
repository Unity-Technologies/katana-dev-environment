Install apache web server:
  pkg.installed:
    - pkgs:
      - apache2

Configure apache settings:
  cmd.run:
    - name: sudo sed -i -- 's:<Directory /var/www/>:<Directory /home/vagrant/shared-files/artifacts/>:g' /etc/apache2/apache2.conf; sudo sed -i -- 's:DocumentRoot /var/www/html:DocumentRoot /home/vagrant/shared-files/artifacts:g' /etc/apache2/sites-available/000-default.conf

Restart server:
  cmd.run:
    - name: sudo service apache2 reload
