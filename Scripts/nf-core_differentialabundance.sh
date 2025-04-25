#!/bin/bash -l
#SBATCH stuff
#SBATCH stuff
#SBATCH stuff
#SBATCH stuff
#SBATCH stuff
#SBATCH stuff
#SBATCH stuff
#SBATCH stuff
#SBATCH stuff

export NXF_SINGULARITY_CACHEDIR="$genarccdir/common/libraries/singularity_cache"
export NXF_OFFLINE='true'

#source conda
source ~/miniconda3/etc/profile.d/conda.sh

conda activate nf-core

nextflow run $genarccdir/wp3/lehnert_testing/nf-core-differentialabundance_1.5.0/1_5_0 \
    --input $genarccdir/wp3/Atlantic_Salmon/SLehnert/RNAseq/sample_seq_data_AS_fordiffabund.txt \
    --contrasts $genarccdir/wp3/Atlantic_Salmon/SLehnert/RNAseq/constrast_simple_acute.txt \
    --matrix $genarccdir/wp3/Atlantic_Salmon/SLehnert/RNAseq/nfcore_rnaseq/star_salmon/salmon.merged.gene_counts_length_scaled.tsv \
    --observations_id_col "sample" \
    --features_id_col "gene_id" \
    --outdir $genarccdir/wp3/Atlantic_Salmon/SLehnert/RNAseq/nfcore_differentialabundance_test \
    --gtf $genarccdir/wp3/Atlantic_Salmon/SLehnert/RNAseq/GCF_905237065.1_Ssal_v3.1_genomic.gtf.gz \
       -profile singularity



