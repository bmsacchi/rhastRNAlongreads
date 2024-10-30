## Description
Snakemake pipeline for mapping, classifying and filtering kinnex bulk RNAseq data. 

input: flnc bams
output: mapped bams, flnc counts, classified isoforms, filtered gffs

Example run:
```
snakemake --use-conda -c32 -s Snakefile
```
note: sample IDs can be added to config instead of Snakefile

## other scripts
`workflow/scripts/fix_gtf.sh` convert gff annotation into to proper format: https://isoseq.how/classification/pigeon-annotation.html
`wokrflow/scripts/fix_ref.sh` remove small scaffolds from reference fasta
