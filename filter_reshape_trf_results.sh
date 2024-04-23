#!/bin/bash

tail -n +16 data/monomers/chr2_centromere_plus2Mb.fasta.2.7.7.80.10.500.500.dat | awk 'BEGIN {
    row_count = 0;
}{
    if (int($3) * (0 + $4) > 10000) {
        print row_count, "chr2:" $1 "-" $2, $5, $14;
        row_count = row_count + 1;
    }
}' >data/monomers/chr2-repeats-10000+.tsv