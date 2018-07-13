#Export Function
require(biomaRt)

EVOexportFasta<-function(gene,species,seqType="cdna") {
  name1<-paste0(species,"_gene_ensembl")
  mart <- useMart("ensembl", dataset = name1)
  for (i in 1:length(gene)) {
    sequences<-NULL
    filename<-NULL
    sequences <- getSequence(id = gene[i], 
                             type="ensembl_gene_id",
                             seqType=seqType,
                             mart=mart) 
    sequences$ensembl_gene_id<-paste0(sequences$ensembl_gene_id,"_in_",species,"_seqtype_",)
    filename<-paste0(gene[i],".fasta")
    exportFASTA(sequences,file=filename)
  }
  
}

EVOexportFasta(gene,"hsapiens")



