#Qury bioMart for sequence info
setwd("/Users/zrt781/project/hackathon2018/EvoAssert")

require(biomaRt)
gene<-c("ENSG00000136244")
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

EVOexportFasta(gene,"hsapiens")


genelist<-read.delim("humanCellCycle.ortholist.OMA.txt",header=T)
genelist<-read.delim("humanCellCycle.ortholist.MUSG.OMA.txt",header=T)

genelist2<-genelist[!is.na(genelist$engine_output),]
looktable<-read.csv("species_lookup.csv",header=T)

setwd("/Users/zrt781/project/hackathon2018/EvoAssert/humanCellCycle_ortholist_MUSG_OMA_fasta.OMA")

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

#Chimp
name1<-paste0(looktable$Ensmbl_dat[3],"_gene_ensembl")
mart <- useMart("ensembl", dataset = name1)
for (i in 1:(dim(genelist3)[1])) {
  subgenelist<-NULL
  string<-as.character(genelist3[i,2])
  subgenelist<-unlist(strsplit(string, ","))
  ziyou<-subgenelist[grep(paste0("^",looktable$gene_id[3]),subgenelist)]
  EVOexportFasta(mart=mart,species=looktable$Ensmbl_dat[3],ziyou,seqType="cdna",orginalgene=genelist3[i,2],orginalSpc="human")
}

#4
name1<-paste0(looktable$Ensmbl_dat[4],"_gene_ensembl")
mart <- useMart("ensembl", dataset = name1)
for (i in 1:(dim(genelist3)[1])) {
  subgenelist<-NULL
  string<-as.character(genelist3[i,3])
  subgenelist<-unlist(strsplit(string, ","))
  ziyou<-subgenelist[grep(paste0("^",looktable$gene_id[4]),subgenelist)]
 
  EVOexportFasta(mart=mart,ziyou,seqType="cdna",orginalgene=genelist3[i,2],orginalSpc="human")
}

#5
name1<-paste0(looktable$Ensmbl_dat[5],"_gene_ensembl")
mart <- useMart("ensembl", dataset = name1)
for (i in 1:(dim(genelist3)[1])) {
  subgenelist<-NULL
  string<-as.character(genelist3[i,3])
  subgenelist<-unlist(strsplit(string, ","))
  ziyou<-subgenelist[grep(paste0("^",looktable$gene_id[5]),subgenelist)]
  
  EVOexportFasta(mart=mart,ziyou,seqType="cdna",orginalgene=genelist3[i,2],orginalSpc="human")
}

#6
name1<-paste0(looktable$Ensmbl_dat[6],"_gene_ensembl")
mart <- useMart("ensembl", dataset = name1)
for (i in 1:(dim(genelist3)[1])) {
  subgenelist<-NULL
  string<-as.character(genelist3[i,3])
  subgenelist<-unlist(strsplit(string, ","))
  ziyou<-subgenelist[grep(paste0("^",looktable$gene_id[6]),subgenelist)]
  
  EVOexportFasta(mart=mart,ziyou,seqType="cdna",orginalgene=genelist3[i,2],orginalSpc="human")
}

#7
name1<-paste0(looktable$Ensmbl_dat[7],"_gene_ensembl")
mart <- useMart("ensembl", dataset = name1)
for (i in 1:(dim(genelist3)[1])) {
  subgenelist<-NULL
  string<-as.character(genelist3[i,3])
  subgenelist<-unlist(strsplit(string, ","))
  ziyou<-subgenelist[grep(paste0("^",looktable$gene_id[7]),subgenelist)]
  
  EVOexportFasta(mart=mart,ziyou,seqType="cdna",orginalgene=genelist3[i,2],orginalSpc="human")
}


#8
name1<-paste0(looktable$Ensmbl_dat[7],"_gene_ensembl")
mart <- useMart("ensembl", dataset = name1)
for (i in 1:(dim(genelist3)[1])) {
  subgenelist<-NULL
  string<-as.character(genelist3[i,3])
  subgenelist<-unlist(strsplit(string, ","))
  ziyou<-subgenelist[grep(paste0("^",looktable$gene_id[8]),subgenelist)]
  
  EVOexportFasta(mart=mart,ziyou,seqType="cdna",orginalgene=genelist3[i,2],orginalSpc="human")
}

















#library(foreach)
#library(doParallel)
#library(parallel)

#cores=detectCores()
#cl <- makeCluster(cores[1]-1) #not to overload your computer
#registerDoParallel(cl)



#mart <- useMart("ensembl", dataset = "hsapiens_gene_ensembl")
#y=listAttributes(mart)
#anno_mart <- getBM(mart=mart, attributes=c('ensembl_gene_id','chromosome_name','exon_chrom_start','exon_chrom_end','gene_exon','cdna'))
#gene<-c("ENSG00000136244","ENSG00000277953",
#        "ENSG00000274078",
#        "ENSG00000160752",
#        "ENSG00000170855",
#        "ENSG00000067334")

#anno_match<- match(gene,anno_mart$ensembl_gene_id)
##chromo<-anno_mart[anno_match,"chromosome_name"]
#start_loc<-anno_mart[anno_match,"exon_chrom_start"]
#end_loc<-anno_mart[anno_match,"exon_chrom_end"]

#sequences <- getSequence(id = gene, 
#                         type="ensembl_gene_id",
#                         seqType="cdna",
#                         mart=mart) 
#sequences$ensembl_gene_id<-paste0(sequences$ensembl_gene_id,"_human")

#exportFASTA(sequences,file="seq4.fasta")

