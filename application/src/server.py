from app import app

import cherrypy

import os
from os.path import expanduser

home = expanduser('~')
file = open(os.path.join(home, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'), 'w+')
file.close()

if __name__ == '__main__':
    import os
    from os.path import expanduser

    home = expanduser('~')
    file = open(os.path.join(home, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'), 'w+')
    file.close()

    # Mount the application
    cherrypy.tree.graft(app, "/")

    # Unsubscrib e the default server
    cherrypy.server.unsubscribe()

    # Instantiate a new server object
    server = cherrypy._cpserver.Server()

    # Configure the server object
    server.socket_host = "0.0.0.0"
    server.socket_port = 8080
    server.thread_pool = 30

    # Subscribe this server
    server.subscribe()
    
    # Start the server engine
    cherrypy.engine.start()
    cherrypy.engine.block()
