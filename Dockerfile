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
WORKDIR OrthoGrasp
RUN mkdir data && \
    python3 scripts/oma-download.py -o data/

# Get more data from omabrowser
WORKDIR data
RUN wget https://omabrowser.org/All/oma-ensembl.txt.gz && \
    gunzip oma-ensembl.txt.gz

# Run perl script to parse data downloaded in last step and generated by python script
WORKDIR /OrthoGrasp/scripts
RUN chmod +x parseAllOMA.sh && \
    ./parseAllOMA.sh

# TODO: We need to install R; Any R dependencies?
# TODO: We need to install Jupyter Notebook
# TODO: We need to launch Jupyter Notebook

