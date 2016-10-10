"""
This module is used for setting the IP that Yumi agents can connect to.
IP must match that used by Yumi's server setting.
If not using Yumi, this module is unnecessary.
"""

from tempfile import mkstemp
from shutil import move
from os import remove, close
import socket


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


ip_address = raw_input("Enter the IP address of the computer running this VM: ")
try:
    socket.inet_aton(ip_address)
    replace(
        "/home/vagrant/shared-files/testmaster/connectionsettings.py",
        'return "http://localhost',
        'return "http://' + ip_address
    )
    replace(
        "/home/vagrant/shared-files/testmaster/connectionsettings.py",
        "yumimanager.getAgentDict(socket.gethostname()",
        "yumimanager.getAgentDict(\"" + ip_address + "\""
    )
    replace(
        "/home/vagrant/shared-files/testmaster/artifactsettings.py",
        "return \"vagrant@localhost\"",
        "return \"vagrant@" + ip_address + "\""
    )
    replace(
        "/home/vagrant/shared-files/testmaster/artifactsettings.py",
        "return \"localhost\"",
        "return \"http://" + ip_address + ":8002\""
    )
    print "Your IP address has been added to /shared-files/testmaster/connectionsettings.py and " \
          "/shared-files/testmaster/artifactsettings.py"
except socket.error:
    print "Error: %s is not a valid IP address." % ip_address
