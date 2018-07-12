#get mouse data set
rm(list=ls())#clean environment
setwd("/home/ubuntu/Dataset")
library(UniProt.ws)

mmusculus <- UniProt.ws(taxId=10090)
species(mmusculus)

hsapiens<-UniProt.ws(taxId=9606)
species(hsapiens)

ptroglodytes<-UniProt.ws(taxId=9598)
species(ptroglodytes)

rnorvegicus<-UniProt.ws(taxId=10116)
species(rnorvegicus)

drerio<-UniProt.ws(taxId=7955)
species(drerio)

trubripes<-UniProt.ws(taxId=31033)
species(trubripes)

dmelanogaster<-UniProt.ws(taxId=7227)
species(dmelanogaster)

celegans<-UniProt.ws(taxId=6239)
species(celegans)

drosophilid<-UniProt.ws(taxId=46245)
species(drosophilid)

#Haemonchus contortus
hcontortus<-UniProt.ws(taxId=6289)
species(hcontortus)

namelist<-c("mmusculus","hsapiens","ptroglodytes","rnorvegicus","drerio","trubripes","dmelanogaster","celegans","drosophilid","hcontortus")
class<-NULL
data<-NULL
protein<-NULL
data_d<-NULL
name<-NULL
for (i in 1:10) {
  print(paste("I am doing",namelist[i]))
  class<-namelist[i]
  data<-get(class)
  protein<-data@taxIdUniprots
  data_d<-select(data,
                 keys = protein,
                 columns = c("SEQUENCE","ENSEMBL"),
                 keytype = "UNIPROTKB")
  name<-paste0(class,"_p2g.csv")
  write.csv(data_d,file=name)
}

