# This is the connection settings file for local Katana builds

from buildbot.status import html, status_push, status_nats
from buildbot.status.web import authz, auth

USER = "myuser"
PASSWORD = "mypassword"
DATABASE = "katana-dev"
HOST = "localhost"
HTTP_PORT = 8001


def get_slave_port():
    """
    Gets the port that slaves should connect to
    """
    return 9901



def get_buildbot_url():
    """
    Gets the URL that users can connect to.
    """
    return "http://10.45.4.98:8001/"


def get_database_url():
    """
    Gets the URL (as a touple) that the server uses to connect to the database.
    """
    details = {
        # This specifies what database buildbot uses to store its state.  You can leave
        # this at its default for all but the largest installations.
        'db_url': "mysql+pymysql://{user}:{password}@{host}/{database}?max_idle=300".format(
            user=USER, password=PASSWORD,
            database=DATABASE, host=HOST
        ),
        'db_poll_interval': 6,
    }
    return details


def get_realtime_server_url():
    """
    Returns the URL that the realtime server (eg: autobahn) is running on
    """
    return "ws://localhost:8010/ws"


def mysql_database():
    """
    Gets the MySQL database containing the Katana builds.
    """
    return DATABASE

