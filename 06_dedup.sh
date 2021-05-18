#!/bin/bash
#SBATCH --nodes=4
#SBATCH --cpus-per-task=4
#SBATCH --time=16:00:00
#SBATCH --account=class
#SBATCH --mem=16GB
#SBATCH --job-name=final_project_dedup
#SBATCH --mail-type=END
#SBATCH --mail-user=jcc874@nyu.edu
#SBATCH --array=23,28,32,37,40-41,46,52,57-60,64-65

module purge
module load picard/2.23.8

#mark duplicated reads
java -jar $PICARD_JAR MarkDuplicates \
INPUT=./sam_bam_files/bwa_aligned_reads_${SLURM_ARRAY_TASK_ID}_sorted.bam \
OUTPUT=./sam_bam_files/dedup_reads_${SLURM_ARRAY_TASK_ID}.bam \
METRICS_FILE=./results/dedup_metrics/metrics_${SLURM_ARRAY_TASK_ID}.txt