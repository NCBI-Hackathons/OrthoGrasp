setwd("/Users/zrt781/project/hackathon2018/EvoAssert")
library(biomaRt)
?useMart
mart=useMart("ensembl")
x<-listDatasets(mart, verbose = FALSE)
y<-listAttributes(mart)

#human hsapiens_gene_ensembl
mart <- useMart("ensembl", dataset = "hsapiens_gene_ensembl")
y<-listAttributes(mart)
anno_mart <- getBM(mart=mart, attributes=c('entrezgene','uniprot_gn','ensembl_gene_id','external_gene_name','description'))
write.csv(anno_mart,file="human_IDconvert.csv")

#mouse mmusculus_gene_ensembl
mart <- useMart("ensembl", dataset = "mmusculus_gene_ensembl")
anno_mart <- getBM(mart=mart, attributes=c('entrezgene','uniprot_gn','ensembl_gene_id','external_gene_name','description'))
write.csv(anno_mart,file="mmusculus_IDconvert.csv")

#C elegans genes (WBcel235)
mart <- useMart("ensembl", dataset = "celegans_gene_ensembl")
anno_mart <- getBM(mart=mart, attributes=c('entrezgene','uniprot_gn','ensembl_gene_id','external_gene_name','description'))
write.csv(anno_mart,file="celegans_IDconvert.csv")

#chimp ptroglodytes
mart <- useMart("ensembl", dataset = "ptroglodytes_gene_ensembl")
anno_mart <- getBM(mart=mart, attributes=c('entrezgene','uniprot_gn','ensembl_gene_id','external_gene_name','description'))
write.csv(anno_mart,file="ptroglodytes_IDconvert.csv")

#Zebrafish genes (GRCz11)
mart <- useMart("ensembl", dataset = "drerio_gene_ensembl")
anno_mart <- getBM(mart=mart, attributes=c('entrezgene','uniprot_gn','ensembl_gene_id','external_gene_name','description'))
write.csv(anno_mart,file="drerio_IDconvert.csv")

#Fugu genes (FUGU 4.0)
mart <- useMart("ensembl", dataset = "trubripes_gene_ensembl")
anno_mart <- getBM(mart=mart, attributes=c('entrezgene','uniprot_gn','ensembl_gene_id','external_gene_name','description'))
write.csv(anno_mart,file="trubripes_IDconvert.csv")

#Fruitfly genes (BDGP6)
mart <- useMart("ensembl", dataset = "dmelanogaster_gene_ensembl")
y<-listAttributes(mart)
anno_mart <- getBM(mart=mart, attributes=c('entrezgene','uniprotswissprot','ensembl_gene_id','external_gene_name','description'))
write.csv(anno_mart,file="dmelanogaster_IDconvert.csv")

#rat
mart <- useMart("ensembl", dataset = "rnorvegicus_gene_ensembl")
y<-listAttributes(mart)
anno_mart <- getBM(mart=mart, attributes=c('entrezgene','uniprot_gn','ensembl_gene_id','external_gene_name','description'))
write.csv(anno_mart,file="rnorvegicus_IDconvert.csv")


