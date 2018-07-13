#Qury bioMart for sequence info
require(biomaRt)

EVOexportFasta<-function(gene,mart=mart,species="xxx",seqType="cdna",orginalgene="xxx",orginalSpc="xxx") {
  for (i in 1:length(gene)) {
    sequences<-NULL
    filename<-NULL
    sequences <- getSequence(id = gene[i], 
                             type="ensembl_gene_id",
                             seqType=seqType,
                             mart=mart)
    sequences<-sequences[!is.null(sequences[,1]),]
    sequences$ensembl_gene_id<-paste0("OrginGene_",orginalgene,"_from_",orginalSpc,"_To_",sequences$ensembl_gene_id,"_in_",species,"_seqType_",seqType)
    filename<-paste0(gene[i],".fasta")
    exportFASTA(sequences,file=filename)
  }
  
}

genelist<-read.delim("humanCellCycle.ortholist.OMA.txt",header=T)
genelist2<-genelist[!is.na(genelist$engine_output),]
looktable<-read.csv("species_lookup.csv",header=T)

setwd("~/humanCellCycle_ortholist_ptroglodytes_OMA_fasta")

genelist3<-genelist2[,]

#Mouse
name1<-paste0(looktable$Ensmbl_dat[1],"_gene_ensembl")
mart <- useMart("ensembl", dataset = name1)
for (i in 1:(dim(genelist3)[1])) {
  subgenelist<-NULL
  string<-as.character(genelist3[i,2])
  subgenelist<-unlist(strsplit(string, ","))
  ziyou<-subgenelist[grep(paste0("^",looktable$gene_id[1]),subgenelist)]
  if (!is.null(ziyou)) {
    EVOexportFasta(mart=mart,species=looktable$Ensmbl_dat[1],ziyou,seqType="3utr",orginalgene=genelist3[i,2],orginalSpc="human")
  }
}


#Human
name1<-paste0(looktable$Ensmbl_dat[2],"_gene_ensembl")
mart <- useMart("ensembl", dataset = name1)
for (i in 1:(dim(genelist3)[1])) {
  subgenelist<-NULL
  string<-as.character(genelist3[i,2])
  subgenelist<-unlist(strsplit(string, ","))
  ziyou<-subgenelist[grep(paste0("^",looktable$gene_id[2]),subgenelist)]
  EVOexportFasta(mart=mart,species=looktable$Ensmbl_dat[2],ziyou,seqType="3utr",orginalgene=genelist3[i,2],orginalSpc="human")
}

#Chimp
name1<-paste0(looktable$Ensmbl_dat[3],"_gene_ensembl")
mart <- useMart("ensembl", dataset = name1)
for (i in 1:(dim(genelist3)[1])) {
  subgenelist<-NULL
  string<-as.character(genelist3[i,2])
  subgenelist<-unlist(strsplit(string, ","))
  ziyou<-subgenelist[grep(paste0("^",looktable$gene_id[3]),subgenelist)]
  EVOexportFasta(mart=mart,species=looktable$Ensmbl_dat[3],ziyou,seqType="3utr",orginalgene=genelist3[i,2],orginalSpc="human")
}

#rnorvegicus
name1<-paste0(looktable$Ensmbl_dat[4],"_gene_ensembl")
mart <- useMart("ensembl", dataset = name1)
for (i in 1:(dim(genelist3)[1])) {
  subgenelist<-NULL
  string<-as.character(genelist3[i,3])
  subgenelist<-unlist(strsplit(string, ","))
  ziyou<-subgenelist[grep(paste0("^",looktable$gene_id[4]),subgenelist)]
  
  EVOexportFasta(mart=mart,species=looktable$Ensmbl_dat[4],ziyou,seqType="3utr",orginalgene=genelist3[i,2],orginalSpc="human")
}

#drerio
name1<-paste0(looktable$Ensmbl_dat[5],"_gene_ensembl")
mart <- useMart("ensembl", dataset = name1)
for (i in 1:(dim(genelist3)[1])) {
  subgenelist<-NULL
  string<-as.character(genelist3[i,3])
  subgenelist<-unlist(strsplit(string, ","))
  ziyou<-subgenelist[grep(paste0("^",looktable$gene_id[5]),subgenelist)]
  
  EVOexportFasta(mart=mart,species=looktable$Ensmbl_dat[5],ziyou,seqType="3utr",orginalgene=genelist3[i,2],orginalSpc="human")
}

#trubripes
name1<-paste0(looktable$Ensmbl_dat[6],"_gene_ensembl")
mart <- useMart("ensembl", dataset = name1)
for (i in 1:(dim(genelist3)[1])) {
  subgenelist<-NULL
  string<-as.character(genelist3[i,3])
  subgenelist<-unlist(strsplit(string, ","))
  ziyou<-subgenelist[grep(paste0("^",looktable$gene_id[6]),subgenelist)]
  
  EVOexportFasta(mart=mart,species=looktable$Ensmbl_dat[6],ziyou,seqType="3utr",orginalgene=genelist3[i,2],orginalSpc="human")
}

#dmelanogaster
name1<-paste0(looktable$Ensmbl_dat[7],"_gene_ensembl")
mart <- useMart("ensembl", dataset = name1)
for (i in 1:(dim(genelist3)[1])) {
  subgenelist<-NULL
  string<-as.character(genelist3[i,3])
  subgenelist<-unlist(strsplit(string, ","))
  ziyou<-subgenelist[grep(paste0("^",looktable$gene_id[7]),subgenelist)]
  
  EVOexportFasta(mart=mart,species=looktable$Ensmbl_dat[7],ziyou,seqType="3utr",orginalgene=genelist3[i,2],orginalSpc="human")
}


#celegans
name1<-paste0(looktable$Ensmbl_dat[7],"_gene_ensembl")
mart <- useMart("ensembl", dataset = name1)
for (i in 1:(dim(genelist3)[1])) {
  subgenelist<-NULL
  string<-as.character(genelist3[i,3])
  subgenelist<-unlist(strsplit(string, ","))
  ziyou<-subgenelist[grep(paste0("^",looktable$gene_id[8]),subgenelist)]
  
  EVOexportFasta(mart=mart,species=looktable$Ensmbl_dat[8],ziyou,seqType="3utr",orginalgene=genelist3[i,2],orginalSpc="human")
}


