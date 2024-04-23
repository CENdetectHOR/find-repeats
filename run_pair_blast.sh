#!/bin/bash
BLASTN=/Applications/bioinfo/ncbi-blast-2.15.0+/bin/blastn

$BLASTN \
    -query <(echo -e ">$1\n$2") \
    -subject <(echo -e ">$3\n$4") -outfmt 6