### Preparing input file 
#### Create .csv for sample input for nf-core/rnaseq (see https://github.com/nf-core/rnaseq/tree/master)

Within RNAseq data directory: Get list of sequence file names for R1 fastq and R2 fastq 
```bash
ls -d *_R1.fastq.gz -1 > list1.txt  # list all files with R1
ls -d *_R2.fastq.gz -1 > list2.txt  # list all files with R2
```

Get list of sample ID names from sequence file names. Here, I get the 7 digits before _R1.fastq.qz which contains the ID names (eg., VHG-001_R1.fastq.gz). I replaced the dash with an underscore for the name of IDs.
```bash
grep -o -P '.{0,7}_R1.fastq.gz' list1.txt | cut -c-7 | tr - _ > list3.txt
```

Combine these lists as columns to match sample input file (contains 4 columns: sample,fastq_1,fastq_2,strandedness). For strandedness column repeat 'auto'
```bash
paste --delimiters=',' list3.txt list1.txt list2.txt | awk '{print $0 ",auto"}' > sample_seq_data_AS.csv
```

Add header to file
```bash
echo -e "sample,fastq_1,fastq_2,strandedness\n$(cat sample_seq_data_AS.csv)" > sample_seq_data_AS.csv
```

### Download Atlantic salmon genome files for pipeline
Access fasta and gtf files from salmon genome on NCBI
```bash
wget -L ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/905/237/065/GCF_905237065.1_Ssal_v3.1/GCF_905237065.1_Ssal_v3.1_genomic.fna.gz
wget -L ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/905/237/065/GCF_905237065.1_Ssal_v3.1/GCF_905237065.1_Ssal_v3.1_genomic.gtf.gz
```


### Run pipeline

Run nf-core rnaseq
```bash
sbatch nf-core_rnaseq.sh
```

