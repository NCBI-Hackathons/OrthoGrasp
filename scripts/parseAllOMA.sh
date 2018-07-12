rm failedOMAparses.txt
touch failedOMAparses.txt

# This has all of the data for all of the OMA ids for all species.
# cd data
# wget https://omabrowser.org/All/oma-ensembl.txt.gz
# gunzip oma-ensembl.txt.gz
# cd ..

workdir = /OrthoGrasp/data/

# This effectively sets which species OMA ids can be converted from.
for species in "CAEEL" "DANRE" "DROME" "HUMAN" "MOUSE" "PANTR" "RATNO" "TAKRU"
do
    grep ^$species $workdir+=oma-ensembl.txt > $workdir+=$species-ensembl.sub.txt
done

# For each of those species files defined above, find the species names and
# run the parsing perl script for each pair of species.
for speciesFile1 in $workdir+=*-ensembl.sub.txt
do
    species1=$(basename $speciesFile1)
    species1=${species1//-ensembl.sub.txt/}
    echo $species1
    for speciesFile2 in $workdir+=*-ensembl.sub.txt
    do
	species2=$(basename $speciesFile2)
	species2=${species2//-ensembl.sub.txt/}
	echo $species2
	if [ $species1 != $species2 ]
	   then
	       (perl parseOMA.2.pl $workdir+=$species1\_$species2\_OMA.csv $workdir+=$species1-ensembl.sub.txt $workdir+=$species2-ensembl.sub.txt > $workdir+=$species1\_$species2\_OMA.withSyn.txt) 2>> failedOMAparses.txt
	fi
    done
done


# Obsolete; uses fasta headers.
#	(perl parseOMA.pl $workdir+=$species1\_$species2\_OMA.csv $workdir+=$species1.fa $workdir+=$species2.fa > $workdir+=$species1\_$species2\_OMA.withSyn.txt) 2>> failedOMAparses.txt
