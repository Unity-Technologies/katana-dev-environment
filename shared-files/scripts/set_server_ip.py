"""
This module is used for setting the IP that Yumi agents can connect to.
IP must match that used by Yumi's server setting.
If not using Yumi, this module is unnecessary.
"""

from tempfile import mkstemp
from shutil import move
from os import remove, close
import socket
import sys


def replace(file_path, pattern, subst):
    """
    Replace all instances of one string or pattern with a substring in a file.
    """
    # Create temp file
    fh, abs_path = mkstemp()
    with open(abs_path, 'w') as new_file:
        with open(file_path) as old_file:
            for line in old_file:
                new_file.write(line.replace(pattern, subst))
    close(fh)
    # Remove original file
    remove(file_path)
    # Move new file
    move(abs_path, file_path)

if len(sys.argv) == 2:
    ip_address = sys.argv[1]
    print "IP address: %s" % ip_address
else:
    ip_address = raw_input("Enter the IP address of the computer running this VM: ")

try:
    socket.inet_aton(ip_address)
except socket.error:
    print "Error: %s is not a valid IP address." % ip_address
    exit(1)

replace(
    "/home/vagrant/shared-files/buildmaster_configuration/buildmaster_configuration/connectionsettings.py",
    'return "http://localhost',
    'return "http://' + ip_address
)
replace(
    "/home/vagrant/shared-files/buildmaster_configuration/buildmaster_configuration/connectionsettings.py",
    "yumimanager.getAgentDict(socket.gethostname()",
    "yumimanager.getAgentDict(\"" + ip_address + "\""
)
replace(
    "/home/vagrant/shared-files/buildmaster_configuration/buildmaster_configuration/artifactsettings.py",
    "return \"vagrant@localhost\"",
    "return \"vagrant@" + ip_address + "\""
)
replace(
    "/home/vagrant/shared-files/buildmaster_configuration/buildmaster_configuration/artifactsettings.py",
    "return \"localhost\"",
    "return \"http://" + ip_address + ":8002\""
)
print "Your IP address has been added to /shared-files/buildmaster_configuration/buildmaster_configuration/connectionsettings.py and " \
      "/shared-files/buildmaster_configuration/buildmaster_configuration/artifactsettings.py"