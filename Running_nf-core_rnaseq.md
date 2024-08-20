## Preparing input file 
### Create .csv for sample input for nf-core/rnaseq (see https://github.com/nf-core/rnaseq/tree/master)

Within RNAseq data directory: Get list of sequence file names for R1 fastq and R2 fastq 
```bash
ls -d *_R1.fastq.gz -1 > list1.txt  # list all files with R1
ls -d *_R2.fastq.gz -1 > list2.txt  # list all files with R2
```

Get list of sample ID names from sequence file names
```bash
grep -o -P '.{0,7}_R1.fastq.gz' list1.txt | cut -c-7 | tr - _ > list3.txt
```

Combine these lists as columns to match sample input file (contains 4 columns: sample,fastq_1,fastq_2,strandedness). For strandedness column repeat 'auto'
```bash
paste --delimiters=',' list3.txt list1.txt list2.txt | awk '{print $0 ",auto"}' > sample_seq_data_AS.csv
```

Combine these lists as columns to match sample input file (contains 4 columns: sample,fastq_1,fastq_2,strandedness). For strandedness column repeat 'auto'
```bash
paste --delimiters=',' list3.txt list1.txt list2.txt | awk '{print $0 ",auto"}' > sample_seq_data_AS.csv
```

Run nf-core rnaseq
```bash
sbatch nf-core_rnaseq.sh
```

Now file is ready for inputting ("sample_seq_data_AS.csv") 
