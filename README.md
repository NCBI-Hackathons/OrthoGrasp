# ORTHOGRASP 
A tool to identify orthology information in several species of interest

<img src="https://github.com/NCBI-Hackathons/EvoAssert/blob/master/orthograsp.jpg" width="400" height="400" />

## Why study orthology?
The identification of orthologs of proteins across species is critical for understanding evolutionary relationships as well  for the annotation of protein sequences from newly sequenced organisms. An integrative tool that allows us to obtain orthologous sequences for a set of genes would be very useful for taking forward phylogenetic studies and
as well as for the identification of orthologous genomic features. Additionally, it will facilitate the study of sequence evolution of a class of genes or a type of sequence across evolution as well as the evolution of microRNA-target relationships, evolution of cis regulatory modules, evolution of translational enhancers.


## What's the problem?
Currently existing orthology engines do not provide the functionality that allows for us to query a list of genes but instead only offer a single-gene query interface. Additionally, most of the existing tools provide the ability to identify a sequence name and possibly the alignment between of proteins in 2 or more species, but do not allow the ability to retrieve other orthologous gene information - including gene/proteins sequence or promoter information or 3' or 5'UTR.

## What's new?
Orthograsp is an integrative tool that provides end to end functionality to identify orthologs. This pipeline can be utilized to obtain orthologous sequences for a given set of genes by harnessing a orthology engine and retrieving sequence information from BioMart. By inputing a list of genes of interest, we can obtain an output fasta file with sequences from the different species of interest. For eg. if one had a list of genes of a given GO term in humans, the tool could be used identify all the orthologous genes in your model organism of interest - say, zebrafish through this quick and easy pipeline. Not only does the tool give the names of the genes in zebrafish, it would also get the cDNA sequences of the genes or 3' UTR sequences etc curated into a single FASTA file. Additionally, this analysis is not limited to a single organism but can be done simultaenously to find the orthologs in multiple species. 

## Dependencies 

Requires R and Jupyter notebook installed

## Species Functionality
Currently, this pipeline can be utilized to find orthologs between the following species.
1. Human (H sapiens)
2. Chimpanzee (P troglodytes)
3. Mouse (M musculus)
4. Zebrafish ( D rerio)
5. Fruitfly (D melanogaster)
6. Pufferfish (T rubriripes)
7. Rat (R novergicus)
8. Worm (C elegans)

## Pipeline Components

![](https://github.com/NCBI-Hackathons/EvoAssert/blob/master/Screen%20Shot%202018-07-12%20at%2011.21.55%20AM.png)

### 1. Input Data 

Input information can be a list of gene sequences in different formats including ENSEMBL IDs and UNIPROT IDs.
The reference genome must be specified as one of the arguments. As does the required output (eg. coding sequences, promoter seq, 5'UTR or 3'UTR etc)

### 2. Orthology Engines

#### a) OMA Browser -  https://omabrowser.org/
The OMA ("Orthologous MAtrix" ) Browser utilized hierarchial orthologous groups (HOGs) to identify orthologs between species. We utilized the browser to generate pairwise comparisons between our species and generated a database that we can query to obtain the orthologs from other species. Faster and more efficient because the code does not need to convert between ids - will matter if querying larger (more than 100 genes) datasets. Does not list paralogs of the reference species.

#### b) EggNOG  - http://eggnogdb.embl.de/#/app/home
The EggNOG tool has a database of orthologous groups with functional annotation. These were predicted using Clusters of Orthologous Groups (COGs). We generated a database for our species of interest from this tool that we can utilize to obtain the orthologs of a given set of genes. Tool can be used to generate paralogs in the reference species.

### 3. Query BioMART
Once we obtain a orthology gene set, we query Biomart to obtain the sequence of interest for every gene. 

### 4. Output Data

This sequence data is combined together into a fasta file that has all the sequence information for all the orthologs of a given set of genes in all species chosen. 

### Usage
This pipeline can be run using 2 main R scripts. One that calls and runs the dataset through the orthology engine either OMA Browser or EggNOG. And the other script takes the output of the orthology engine, parses through it and queries BioMart to get the sequences.  

#### (1) Orthology engine 

Rscript --vanilla master_script.R omabrowser ~/EvoAssert/humansurvival3.txt human all
 
 arg1 (required) - method (eggnog, omabrowser)
 
 arg2 (required) - input file of genes in ensembl gene id with no header
 
 arg3 (required) - original species
 
 arg4 (required) - species of interest to find orthologs (choose between human, worm, fly, mouse, rat, pufferfish, chimp, zebrafish or all)
 arg5 (required) - output name

#### (2) Query Biomart

Rscript get_gene_sequence_clean.R

### Docker

Coming Up




