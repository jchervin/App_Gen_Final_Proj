#!/bin/bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --account=class
#SBATCH --mem=16GB
#SBATCH --job-name=snpEff
#SBATCH --mail-type=END
#SBATCH --mail-user=jcc874@nyu.edu
#SBATCH --array=21,22,24-27,29-31,34-36,38-39,42-45,47-51,53-56,61-62,66

module purge
module load snpeff/4.3t

cd ./data

#annotate with SnpEff
java -jar $SNPEFF_JAR \
-c /share/apps/snpeff/4.3t/snpEff.config \
-v hg19 \
-dataDir /scratch/jcc874/appl_genomics/Final_Project/data \
-stats /scratch/jcc874/appl_genomics/Final_Project/results/snpEff/snpEff_${SLURM_ARRAY_TASK_ID} \
/scratch/jcc874/appl_genomics/Final_Project/results/vcf/gatk/filtered_snps_${SLURM_ARRAY_TASK_ID}.vcf > /scratch/jcc874/appl_genomics/Final_Project/results/vcf/gatk/filtered_snps_${SLURM_ARRAY_TASK_ID}.ann.vcf