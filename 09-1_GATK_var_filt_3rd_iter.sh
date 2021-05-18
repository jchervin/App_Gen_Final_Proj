#!/bin/bash
#SBATCH --nodes=4
#SBATCH --cpus-per-task=4
#SBATCH --time=16:00:00
#SBATCH --account=class
#SBATCH --mem=16GB
#SBATCH --job-name=var_filt_iter3
#SBATCH --mail-type=END
#SBATCH --mail-user=jcc874@nyu.edu
#SBATCH --array=24,25,27,31,36,54-56,61,66

module purge
module load gatk/4.1.9.0

#filter SNPs
java -jar $GATK_JAR VariantFiltration \
-R ./data/genome/hg19.fa \
-V ./results/vcf/gatk/raw_snps_${SLURM_ARRAY_TASK_ID}.vcf \
--filter-name "DP_filter" \
-filter "DP<7" \
--filter-name "QD_filter" \
-filter "QD<2.0" \
--filter-name "FS_filter" \
-filter "FS>30.0" \
--filter-name "MQ_filter" \
-filter "MQ<40.0" \
--filter-name "SOR_filter" \
-filter "SOR>10.0" \
--filter-name "AF_filter_1" \
-filter "AF<0.10" \
--filter-name "AF_filter_2" \
-filter "AF>0.75" \
-O ./results/vcf/gatk/filtered_snps_${SLURM_ARRAY_TASK_ID}_iter3.vcf