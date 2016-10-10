Install NodeJS:
  cmd.run:
    - name: curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash - ; apt-get install -y nodejs

  pkg.installed:
    - pkgs:
      - npm

Install grunt:
  cmd.run:
    - name: npm install -g grunt-cli

Install Compass:
  gem.installed:
    - name: compass

Install breakpoint:
  gem.installed:
    - name: breakpoint
    - version: 2.5.0

Install npm:
  cmd.run:
    - name: cd /home/vagrant/shared-files/katana/www; npm install karma@0.12.0 --no-bin-links; npm install --no-bin-links
