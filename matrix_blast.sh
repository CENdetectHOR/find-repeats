#!/bin/bash
BLASTN=/Applications/bioinfo/ncbi-blast-2.15.0+/bin/blastn
TRF_FILE=data/monomers/chr2-repeats-10000+.tsv
join -j 5 $TRF_FILE $TRF_FILE | awk '{
    subseq_label = $1;
    superseq_label = $5;
    subseq_length = int($3);
    superseq_length = int($7);
    subseq_seq = $4;
    superseq_seq = $8;
    if (subseq_length < superseq_length || (subseq_length == superseq_length && subseq_label < superseq_label)) {
        system("./run_pair_blast.sh " subseq_label " " subseq_seq subseq_seq " " superseq_label " " superseq_seq );
    }
}' >data/monomers/chr2-repeats-10000+-matrix.tsv
# /Applications/bioinfo/ncbi-blast-2.15.0+/bin/blastn -query data/monomers/query.fasta -subject data/monomers/chr2_centromere_plus2Mb.fasta -outfmt 6 
        # system("'$BLASTN' -query <(echo -e \">" subseq_label "\\n" subseq_seq "\") -subject <(echo -e \">" superseq_label "\\n" superseq_seq "\") -outfmt 6");
