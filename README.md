# ORTHOGRASP 
A tool to identify orthology information in several species of interest

![](https://github.com/NCBI-Hackathons/EvoAssert/blob/master/orthograsp.jpg = 24x48)

This pipeline can be utilized to obtain orthologous sequences for a given set of genes by harnessing a orthology engine and retrieving sequence information from BioMart. By inputing a list of genes of interest, we can obtain an output fasta file with sequences from the different species of interest. 

## What's the problem?




## Dependencies 

Requires Jupyter notebook installed

## Species Functionality
Currently, this pipeline can be utilized to find orthologs between the following species.
1. Human (H Sapiens)
2. Chimpanzee (P Troglodytes)
3. Mouse (M Musculus)
4. Zebrafish ( D Rerio)
5. Fruitfly (D Melanogaster)
6. Pufferfish (T Rubriripes)
7. Rat (R Novergicus)
8. Worm (C Elegans)

## Pipeline Components 

![](https://github.com/NCBI-Hackathons/EvoAssert/blob/master/Screen%20Shot%202018-07-12%20at%2011.21.55%20AM.png)

### 1. Input Data 

Input information can be a list of gene sequences in different formats including ENSEMBL IDs and UNIPROT IDs.
The reference genome must be specified as one of the arguments. As does the required output (eg. coding sequences, promoter seq, 5'UTR or 3'UTR etc)

### 2. Orthology Engines

#### a) OMA Browser -  https://omabrowser.org/
The OMA ("Orthologous MAtrix" ) Browser utilized hierarchial orthologous groups (HOGs) to identify orthologs between species. We utilized the browser to generate pairwise comparisons between our species and generated a database that we can query to obtain the orthologs from other species.

#### b) EggNOG  - http://eggnogdb.embl.de/#/app/home
The EggNOG tool has a database of orthologous groups with functional annotation. These were predicted using Clusters of Orthologous Groups (COGs). We generated a database for our species of interest from this tool that we can utilize to obtain the orthologs of a given set of genes. 

### 3. BioMART query 
Once we obtain a orthology gene set, we query Biomart to obtain the sequence of interest for every gene. 

### 4. Output Data

This sequence data is combined together into a fasta file that has all the sequence information for all the orthologs of a given set of genes in all species chosen. 





