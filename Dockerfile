########################################################
# Dockerfile to build Python WSGI Application Containers
# Based on Ubuntu
########################################################

# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
MAINTAINER Jose Haro

# Add the applicaiton resources URL
RUN distrib=$(cat /etc/lsb-release | grep DISTRIB_CODENAME)
RUN version=${distrib#*=}
RUN echo "deb http://archive.ubuntu.com/ubuntu/ $(lsb_release -sc) main universe" >> /etc/apt/sources.list

# Update the sources list
RUN apt-get update

# Install basic applications
RUN apt-get install -y tar git curl nano wget dialog net-tools build-essential

# Install Python and Basic Python Tools
RUN apt-get install -y python3 python3-dev python-distribute python3-pip

# Create app directory
RUN mkdir /home/py_app

# Go into the app directory
RUN cd /home/py_app

# Clone git repository
RUN git clone https://github.com/abunuwas/containter.git

# Get into the application's folder
RUN cd containter

# Create virtual environment
RUN virtualenv venv --python=python3

# Activate virtual environment
RUN source venv/bin/activate

# Install Python dependencies
RUN pip install -r requirements.txt

# Expose ports
EXPOSE 8080

# Set the default directory where CMD will execute
WORKDIR /home/py_app/containter

# Set the default command to execute
# when creating a new container
CMD python server.py


