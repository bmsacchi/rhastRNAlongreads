## Description
The goal of this project is to identify problems with previous kinnex pipeline that resulted in loss of X and Y sequences, and remap/classify/filter.
Mapped bams will be used for downstream RNAseq analysis, isoform identification, etc.

Samples are from R. hastatulus male and female flower buds.

## directories and important files
resources/flnc-x.bam - 4 unmapped bam files provided by sickkids sequencing. Original versions in /ohta1/emily.glasgow/Mykhailo_data/Kinnex/WU2U3LR/GLA27952.20240705/GLA27952-Pool_150PM_CELL1/outputs/

# main pipeline
workflow/Snakefile - pbmm2 align, isoseq collapse, pigeon prepare, pigeon classify, pigeon filter -  
workflow/config.yaml

# scripts

To remove small scaffolds (keeping them resulted in the X and Y being lost from the output) and properly format the gtf for Pigeon
workflow/scripts/fix_gtf.sh
workflow/scripts/fix_ref.sh

# gffs and fastas
Original gff/fastas, contains X without the PAR, Y with PAR + all autosomes from the haplotype 2 assembly 
/ohta2/bianca.sacchi/annotation_TX/noMatPAR_txanno/merged_TX_noMatPAR.fa
/ohta2/bianca.sacchi/annotation_TX/noMatPAR_txanno/merged_TX_noMatPARlarge_txanno.gff

Used in pipeline:
resources/merged_TX_noMatPAR.modified.gtf
resources/merged_TX_noMatPARlarge.fa

# original outputs, missing X and Y
/ohta1/emily.glasgow/Mykhailo_data/Kinnex/WU2U3LR/GLA27952.20240705/GLA27952-Pool_150PM_CELL1/outputs 
symlinked as outputs/ in this directory.

# output from my attemps in October 2024
results/ -  includes gffs containing classified/clustered isoforms for each sample (separately), flnc counts, etc.
