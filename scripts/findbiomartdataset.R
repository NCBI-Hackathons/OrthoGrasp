setwd("/OrthoGrasp/data")
library(biomaRt)


#human hsapiens_gene_ensembl
mart <- useMart('ensembl', dataset = 'hsapiens_gene_ensembl')
anno_mart <- getBM(mart=mart, attributes=c(‘ensembl_peptide_id’,‘entrezgene’,‘uniprot_gn’,‘ensembl_gene_id’,‘external_gene_name’,‘description’))
anno_mart$specie<-"hsapiens”

#mouse mmusculus_gene_ensembl
mart_2 <- useMart("ensembl”, dataset = “mmusculus_gene_ensembl”)
anno_mart_2 <- getBM(mart=mart_2, attributes=c(‘ensembl_peptide_id’,‘entrezgene’,‘uniprot_gn’,‘ensembl_gene_id’,‘external_gene_name’,‘description’))
anno_mart_2$specie<-"mmusculus”
anno_mart_all<-rbind(anno_mart,anno_mart_2)

#C elegans genes (WBcel235)
mart3 <- useMart("ensembl”, dataset = “celegans_gene_ensembl”)
anno_mart3 <- getBM(mart=mart3, attributes=c(‘ensembl_peptide_id’,‘entrezgene’,‘uniprot_gn’,‘ensembl_gene_id’,‘external_gene_name’,‘description’))
anno_mart3$specie<-"celegans”
anno_mart_all<-rbind(anno_mart_all,anno_mart3)

#chimp ptroglodytes
mart4 <- useMart("ensembl”, dataset = “ptroglodytes_gene_ensembl”)
anno_mart4 <- getBM(mart=mart4, attributes=c(‘ensembl_peptide_id’,‘entrezgene’,‘uniprot_gn’,‘ensembl_gene_id’,‘external_gene_name’,‘description’))
anno_mart4$specie<-"ptroglodytes”
anno_mart_all<-rbind(anno_mart_all,anno_mart4)



#Zebrafish genes (GRCz11)
mart5 <- useMart("ensembl”, dataset = “drerio_gene_ensembl”)
anno_mart5 <- getBM(mart=mart5, attributes=c(‘ensembl_peptide_id’,‘entrezgene’,‘uniprot_gn’,‘ensembl_gene_id’,‘external_gene_name’,‘description’))
anno_mart5$specie<-"drerio”
anno_mart_all<-rbind(anno_mart_all,anno_mart5)


#Fugu genes (FUGU 4.0)
mart6 <- useMart("ensembl”, dataset = “trubripes_gene_ensembl”)
anno_mart6 <- getBM(mart=mart6, attributes=c(‘ensembl_peptide_id’,‘entrezgene’,‘uniprot_gn’,‘ensembl_gene_id’,‘external_gene_name’,‘description’))
anno_mart6$specie<-"trubripes”
anno_mart_all<-rbind(anno_mart_all,anno_mart6)


#Fruitfly genes (BDGP6)
mart7 <- useMart("ensembl”, dataset = “dmelanogaster_gene_ensembl”)
anno_mart7 <- getBM(mart=mart7, attributes=c(‘ensembl_peptide_id’,‘entrezgene’,‘uniprotswissprot’,‘ensembl_gene_id’,‘external_gene_name’,‘description’))
anno_mart7$specie<-"dmelanogaster”
colnames(anno_mart7)[3]<-"uniprot_gn”
anno_mart_all<-rbind(anno_mart_all,anno_mart7)


#rat
mart8 <- useMart("ensembl”, dataset = “rnorvegicus_gene_ensembl”,ensemblRedirect = FALSE)
anno_mart8 <- getBM(mart=mart8, attributes=c(‘ensembl_peptide_id’,‘entrezgene’,‘uniprot_gn’,‘ensembl_gene_id’,‘external_gene_name’,‘description’))
anno_mart8$specie<-"rnorvegicus”
anno_mart_all<-rbind(anno_mart_all,anno_mart8)

write.csv(anno_mart_all,file="ID_convert_dataset_all8spc.csv”)