#!/bin/bash

tail -n +16 data/monomers/chr2_centromere_plus2Mb.fasta.2.7.7.80.10.500.500.dat | awk '{print "chr2:" $1 "-" $2, $5, $14}' >data/monomers/chr2-repeats.tsv