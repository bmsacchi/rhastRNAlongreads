## Description
Snakemake pipeline for mapping, classifying and filtering kinnex bulk RNAseq data. 

input: flnc bams
output: mapped bams, flnc counts, classified isoforms, filtered gffs

Example run:
```
snakemake --use-conda -c32 -s Snakefile
```
note: sample IDs can be added to config instead of Snakefile
