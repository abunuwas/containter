########################################################
# Dockerfile to build Python WSGI Application Containers
# Based on Ubuntu
########################################################

# Set the base image to Ubuntu
FROM ubuntu:xenial

# File Author / Maintainer
MAINTAINER Jose Haro

# Add the applicaiton resources URL
#RUN distrib=$(cat /etc/lsb-release | grep DISTRIB_CODENAME);
#RUN echo $distrib;
#RUN version=${distrib#*=};
#RUN echo "deb http://archive.ubuntu.com/ubuntu/ $(cat /etc/lsb-release | grep DISTRIB_CODENAME | sed -e 's/.*=//') main universe" >> /etc/apt/sources.list

# Update the sources list
RUN apt-get update

# Install basic applications
RUN apt-get install -y tar git curl nano wget dialog net-tools build-essential unzip

# Install Python and Basic Python Tools
RUN apt-get install -y python3 python3-dev python-distribute python3-pip virtualenv

# Create app directory
#RUN mkdir /home/py_app

# Go into the app directory
#RUN cd /home/py_app

# Clone git repository
#ADD https://github.com/abunuwas/containter/archive/master.zip /home/
#RUN #!/bin/bash if [ -d /containter-master ]; then rm -rf /containter-master; fi

#RUN unzip /home/master.zip -d /
#ADD id_rsa /containter-master/

RUN mkdir /home/application

ADD application /home/application/

RUN #!/bin/bash if [ -d /application ]; then rm -rf /application; fi

#RUN mkdir /application

RUN mv /home/application /

#RUN rm -rf /home/master.zip
#RUN cd containter-master && git pull origin master

# Get into the application's folder
#RUN cd containter

# Create virtual environment
#RUN virtualenv containter/venv --python=python3

# Activate virtual environment
#RUN containter/venv/bin/activate

# Install Python dependencies
RUN pip3 install -r /application/requirements.txt

# Expose ports
EXPOSE 8080
EXPOSE 80

VOLUME /root

# Set the default directory where CMD will execute
WORKDIR /application/src/

# Set the default command to execute
# when creating a new container
CMD python3 server.py


