FROM ubuntu:18.04
MAINTAINER Phillip Rak <phillip.rak@northwestern.edu>

# Update the container
RUN apt-get update && apt-get upgrade -y

# Install utilities
RUN apt-get install wget python3-pip -y

# Install dependencies
RUN pip3 install pandas requests
