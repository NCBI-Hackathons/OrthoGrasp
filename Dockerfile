FROM ubuntu:18.04
MAINTAINER Phillip Rak <phillip.rak@northwestern.edu>

# Update the container
RUN apt-get update && apt-get upgrade -y

# Install utilities
RUN apt-get install wget -y

# Install dependencies
RUN apt-get install ncbi-blast+ mcl -y
#  Install fastme
RUN wget http://www.atgc-montpellier.fr/download/sources/fastme/fastme-2.1.5.tar.gz
# RUN tar xzf fastme-2.1.5.tar.gz 

# Install OrthoFinder
RUN wget https://github.com/davidemms/OrthoFinder/releases/download/v2.2.6/OrthoFinder-2.2.6.tar.gz
RUN tar xzf OrthoFinder-2.2.6.tar.gz