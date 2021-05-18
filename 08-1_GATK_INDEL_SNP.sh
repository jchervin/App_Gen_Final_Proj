#!/bin/bash
#SBATCH --nodes=4
#SBATCH --cpus-per-task=4
#SBATCH --time=16:00:00
#SBATCH --account=class
#SBATCH --mem=16GB
#SBATCH --job-name=GATK_INDEL_SNP
#SBATCH --mail-type=END
#SBATCH --mail-user=jcc874@nyu.edu
#SBATCH --array=21,22,24-27,29-31,34-36,38-39,42-45,47-51,53-56,61-62,66

module purge
module load gatk/4.1.9.0

#use SelectVariants mode in GATK to separate indels and SNPs
gatk SelectVariants -R ./data/genome/hg19.fa \
-V ./results/vcf/gatk/raw_variants_GATK_${SLURM_ARRAY_TASK_ID}.vcf -select-type SNP \
-O ./results/vcf/gatk/raw_snps_${SLURM_ARRAY_TASK_ID}.vcf

gatk SelectVariants -R ./data/genome/hg19.fa \
-V ./results/vcf/gatk/raw_variants_GATK_${SLURM_ARRAY_TASK_ID}.vcf -select-type INDEL \
-O ./results/vcf/gatk/raw_indels_${SLURM_ARRAY_TASK_ID}.vcf