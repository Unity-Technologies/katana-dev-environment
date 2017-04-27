import socket
import getpass

ip_address = raw_input("Enter the IP address of the computer running this VM: ")
try:
    socket.inet_aton(ip_address)
except socket.error:
    print "Error: %s is not a valid IP address." % ip_address
    exit(1)

username = raw_input("Enter the username used for connecting to Ono: ")
password = getpass.getpass("Enter the password used for connecting to Ono: ")

pillar_content = "host_ip: %s" % ip_address

hgrc_content = """[extensions]
largefiles =
[auth]
ono.schemes = https
ono.prefix = ono.unity3d.com
ono.username = %s
ono.password = %s
""" % (username, password)

print "Writing settings to shared-files/pillar/data.sls"

with open("shared-files/pillar/data.sls", "w") as f:
    f.write(pillar_content)
with open("shared-files/scripts/hgrcfile", "w") as f2:
    f2.write(hgrc_content)