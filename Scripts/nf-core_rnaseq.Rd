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

export NXF_SINGULARITY_CACHEDIR="/gpfs/fs7/grdi/genarcc/common/libraries/singularity_cache"
export NXF_OFFLINE='true'

source /gpfs/fs7/grdi/genarcc/common/conda/miniconda3/etc/profile.d/conda.sh

conda activate nf-core

nextflow run /gpfs/fs7/grdi/genarcc/wp3/lehnert_testing/nf-core-rnaseq_3.14.0/3_14_0 \
    --input /gpfs/fs7/grdi/genarcc/wp3/Atlantic_Salmon/SLehnert/RNAseq/sample_seq_data_AS.csv \
    --outdir /gpfs/fs7/grdi/genarcc/wp3/Atlantic_Salmon/SLehnert/RNAseq/nfcore_rnaseq \
    --fasta /gpfs/fs7/grdi/genarcc/wp3/Atlantic_Salmon/SLehnert/RNAseq/GCF_905237065.1_Ssal_v3.1_genomic.fna.gz \
    --gtf /gpfs/fs7/grdi/genarcc/wp3/Atlantic_Salmon/SLehnert/RNAseq/GCF_905237065.1_Ssal_v3.1_genomic.gtf.gz \
    --save_reference \
      -profile singularity






