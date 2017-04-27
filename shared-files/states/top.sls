# This state is the highstate that runs when setting up Vagrant, and ensures the setup steps are performed
# It can be run by calling:
#	sudo salt-call state.highstate
base:
  '*':
    - setup-step1
    - setup-step2
    - setup-step3
    - setup-step4
    - setup-step5
    - start-autobahn
    - start-artifactserver
    - disable-restarts
    - set-slave-ip
