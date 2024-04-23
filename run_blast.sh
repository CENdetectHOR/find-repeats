#!/bin/bash
~/Downloads/ncbi-blast-2.15.0+/bin/blastn -query data/monomers/query.fasta -subject data/monomers/chr2_centromere_plus2Mb.fasta -outfmt 6 -task rmblastn | awk '{
    split($2,idVsRange,":"); split(idVsRange[2],startVsEnd,"-");
    
    if (int($9) < int($10))
        print $2, $9, $10, ".", $3, "+";
    else
        print $2, $10, $9, ".", $3, "-";
}' | sort >data/monomers/chr2_blastn_rm.bed