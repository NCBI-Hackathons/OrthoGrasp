#! Rscript --vanilla

library(readr)
library(dplyr)

df <- readr::read_tsv("meNOG.members.tsv", col_names = FALSE) %>%
    dplyr::select(X2, X6) %>%
    dplyr::mutate(genes = NA)

species_id <- c("10090.", "9606.", "9598.", "10116.", "7955.", "31033.", "7227.", "6239.")
a <- character(0)
for(i in 1:nrow(df)) {
    row <- stringr::str_split(df$X6[i], ",")[[1]]
    keep <- stringr::str_split_fixed(grep(paste(species_id, collapse = "|"), row, value = T), "\\.", 2)[,2]
    if(identical(a, keep)) {
        df$genes[i] <- NA
    } else {
        df$genes[i] <- paste(keep, collapse = ",")
    }
}

df_species <- df %>%
    na.omit() %>%
    dplyr::select(orthogroup = X2, genes)


readr::write_tsv(df_species, "eggnog_spfiltered.tsv")
