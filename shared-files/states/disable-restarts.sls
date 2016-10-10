# Thsi file replaces the script Linux uses for restarting the machine. This prevents the VM going down whenever a service tries to restart a slave. The log for what's calling the restart can be found in /tmp/fakehalt.log

Create replacement restart script:
  file.append:
    - name: /bin/fakehalt
    - text:
      - #!/bin/bash
      - exec >>/tmp/fakehalt.log 2>&1
      - date
      - echo "CMD=$0 PID=$$"
      - ps -ef --forest
      - echo '========'

Replace restart script:
  cmd.run:
    - name: chmod a+x /bin/fakehalt; mv /sbin/halt /sbin/halt.orig; ln -s /bin/fakehalt /sbin/halt; mv /sbin/shutdown /sbin/shutdown.orig; ln -s /bin/fakehalt /sbin/shutdown