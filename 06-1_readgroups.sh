#!/bin/bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --account=class
#SBATCH --mem=16GB
#SBATCH --job-name=readgroups
#SBATCH --mail-type=END
#SBATCH --mail-user=jcc874@nyu.edu
#SBATCH --array=21,22,24-27,29-31,34-36,38-39,42-45,47-51,53-56,61-62,66

module purge
module load picard/2.23.8

#add read group to the BAM
java -jar $PICARD_JAR \
AddOrReplaceReadGroups \
I=./sam_bam_files/dedup_reads_${SLURM_ARRAY_TASK_ID}.bam \
O=./sam_bam_files/dedup_reads_${SLURM_ARRAY_TASK_ID}_rg.bam \
RGID=ERR22623_${SLURM_ARRAY_TASK_ID} \
RGLB=ERR22623 \
RGPL=ILLUMINA RGPM=HISEQ \
RGPU=ERR22623 \
RGSM=${SLURM_ARRAY_TASK_ID}

#RGID = read group ID
#RGLB = library
#RGPU = platform unit
#RGSM = sample