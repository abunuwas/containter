########################################################
# Dockerfile to build Python WSGI Application Containers
# Based on Ubuntu
########################################################

# Set the base image to Ubuntu
FROM ubuntu:xenial

# File Author / Maintainer
MAINTAINER Jose Haro

# Update the sources list
RUN apt-get update

# Install basic applications
RUN apt-get install -y tar git curl nano wget dialog net-tools build-essential unzip

# Install Python and Basic Python Tools
RUN apt-get install -y python3 python3-dev python-distribute python3-pip virtualenv

# Create a directory to host the application code temporarily in the /home directory
RUN mkdir /home/application

# Copy application code into the newly created directory
ADD application /home/application/

# Create a directory for the application in the root path /
RUN #!/bin/bash if [ -d /application ]; then rm -rf /application; fi

# Move the application code from the /home directory to the /application directory
RUN mv /home/application /

# Install Python dependencies for the application
RUN pip3 install -r /application/requirements.txt

# Expose ports
EXPOSE 8080
EXPOSE 80

# Just for the sake of illustration:
# mount a directory in the container
# for use as a docker data volume
VOLUME /root

# Set the default directory where CMD will execute
WORKDIR /application/src/

# Set the default command to execute
# when creating a new container
CMD python3 server.py


