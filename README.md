# Applied Genomics Final Project
NYU Spring 2021

1. Download_data.sh

    a. Download fastq files from SRA run selector
    
2. Fastqc.sh

    a. Run and review QC results
    
3. ref_genome.sh

    a. Download reference genome zip (https://gatk.broadinstitute.org/hc/en-us/articles/360035890711-GRCh37-hg19-b37-humanG1Kv37-Human-Reference-Discrepancies#hg19) 
      
      i. Manually uploaded from local to ...Final_Project/data/genome directory
      
      ii. Unzip: in command line tar -zxvf chromFa.tar.gz
      
      iii. Concatenate: in command line cat chr*.fa > hg19.fa
    
    b. Index
    
4. Align.sh
    
    a. Using bwa
    
    b. Output of seq alignment is a sam file
    
5. Sam_to_bam.sh
    
    a. Sort the sam file by coordinate and convert to bam (bam = binary version)
    
    b. Deleted the sam files
    
6. Dedup.sh
    
    a. Mark (PCR) duplicates using Picard/GATK
    
7. Readgroups.sh
    
    a. Add readgroups
    
8. Sequence dict from ref genome & index bam files
    
    a. Indexing
      
      i. Create Sequence Dictionary from Reference Genome
      
      ii. Index ref
      
      iii. Index dedup.bam
      
9. VARIANT CALLING
    
    a. GATK.sh
      
      i. Haplotype caller
    
    b. GATK_INDEL_SNP.sh
      
      i. Separate indels and SNPs
    
    c. GATK_var_filt.sh
      
      i. Filtering
    
    d. snpEff.sh
      
      i. ANNOTATION

