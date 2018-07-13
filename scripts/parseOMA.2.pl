#!/opt/local/bin/perl -w

use strict;
no warnings 'uninitialized';

if($#ARGV < 0) {
    print STDERR "Useage: $0 < OMAid Species Pairwise > < Species Ref >\n";
  exit;
}

#
# This script takes a set of Pairwise orthology relationships for a pair of
# species keyed by OMA ID (downloaded from https://omabrowser.org/oma/genomePW/)
# as well as an OMA reference file (https://omabrowser.org/All/oma-ensembl.txt.gz),
# and returns the pairwise relationship with synonyms substituted for
# OMA ids (the synonyms are found in the reference file).
#
# Example:
# perl parseOMA.pl data/HUMAN_DROME_OMA.csv data/HUMAN-ensembl.sub.txt data/DROME-ensembl.sub.txt > data/HUMAN_DROME_OMA.withSyn.csv

my $omaFile = $ARGV[0];
my $omaRef1 = $ARGV[1];
my $omaRef2 = $ARGV[2];
my (%synonyms);

my $seq = "";
my $header = "";

for my $ref ($omaRef1,$omaRef2){
    open (REF,$ref);
    while (<REF>){
	chomp $_;
	my ($omaID,$refID) = split (/\t/,$_);
	$refID =~ s/transcript_id=//g;
	$refID =~ s/ /,/g;
	# Strip out the trailing decimal from Ensembl IDs
	if ($refID =~ /^(EN\w+)\.\d+/){
	    $refID = $1;
	}
	if (exists($synonyms{$omaID})){
	    $synonyms{$omaID} .= ",$refID";
	}else {
	    $synonyms{$omaID} = "$refID";
	}
    }
    close REF;
}

open (OMA, $omaFile);
while (<OMA>){
    chomp $_;
    my($omaID1,$omaID2,$relationship,$number) = split(/\t/,$_);
#    print STDERR "$omaID1\t$omaID2\n";
    my $synList1 = $synonyms{$omaID1};
    my $synList2 = $synonyms{$omaID2};
    print "$omaID1,$synList1\t$omaID2,$synList2\t$relationship\t$number\n";
}
