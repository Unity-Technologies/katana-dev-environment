"""
This module defines the artifact server details used for this version of Buildmaster
"""

####### ARTIFACT CHECK
def get_artifact_server():
    return "vagrant@10.45.4.98"

def get_artifact_server_directory():
    return "/home/vagrant/shared-files/artifacts"

def get_artifact_server_url():
    return "http://10.45.4.98:8002"

def get_artifact_server_port():
    """
    A port is only required if using a non-default SSH port (eg: with port forwarding)
    :return: integer, or None for using default port
    """
    return 2233
