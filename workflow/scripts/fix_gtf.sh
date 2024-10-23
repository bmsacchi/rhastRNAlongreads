#!/bin/bash

# pigeon hates my gtf (genome ref)

#https://isoseq.how/classification/pigeon-annotation.html

cat merged_TX_noMatPARlarge_txanno.gff | python -c '
import sys
for line in sys.stdin:
    fields = line.split("\t")
    if len(fields) > 8:
       if fields[2]=="gene":
         fields[8] = fields[8].replace("Name=","gene_name=")
    sys.stdout.write("\t".join(fields))
' >merged_tx_noMatPAR.modified.gff

gffread merged_tx_noMatPAR.modified.gff -T --keep-genes -o merged_tx_noMatPAR.modified.gtf
