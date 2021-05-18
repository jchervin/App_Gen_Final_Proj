#!/bin/bash
#SBATCH --nodes=4
#SBATCH --cpus-per-task=4
#SBATCH --time=16:00:00
#SBATCH --account=class
#SBATCH --mem=16GB
#SBATCH --job-name=indexing
#SBATCH --mail-type=END
#SBATCH --mail-user=jcc874@nyu.edu
#SBATCH --array=21,22,24-27,29-31,34-36,38-39,42-45,47-51,53-56,61-62,66

module purge
module load samtools/intel/1.11

#index dedup_reads.bam
samtools index ./sam_bam_files/dedup_reads_${SLURM_ARRAY_TASK_ID}_rg.bam