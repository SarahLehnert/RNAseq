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

nextflow run $genarccdir/wp3/lehnert_testing/nf-core-rnaseq_3.14.0/3_14_0 \
    --input $projdir/sample_seq_data_AS.csv \
    --outdir $projdir/nfcore_rnaseq \
    --fasta $projdir/GCF_905237065.1_Ssal_v3.1_genomic.fna.gz \
    --gtf $projdir/GCF_905237065.1_Ssal_v3.1_genomic.gtf.gz \
    --save_reference \
      -profile singularity


#note:
#projdir= indicate path for working directory
#genarccdir=indicates path for genarcc directory
