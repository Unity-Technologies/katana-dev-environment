Set permissions for running without sudo:
  cmd.run:
    - name: sudo chown -R vagrant /etc/salt /var/cache/salt /var/log/salt /var/run/salt
