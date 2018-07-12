FROM ubuntu:18.04
MAINTAINER Phillip Rak <phillip.rak@northwestern.edu>

# Update the container
RUN apt-get update && apt-get upgrade -y

# Install utilities
RUN apt-get install wget python3-pip git -y

# Install dependencies
RUN pip3 install pandas requests

# Clone the repo so that we can run our scripts
RUN git clone -b feature/container https://github.com/NCBI-Hackathons/OrthoGrasp.git

# Run python script to copy data from omabrowser
RUN mkdir OrthoGrasp/data && \
    python3 OrthoGrasp/scripts/oma-download.py
