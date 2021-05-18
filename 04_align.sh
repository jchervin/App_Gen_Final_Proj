#!/bin/bash
#SBATCH --nodes=4
#SBATCH --cpus-per-task=4
#SBATCH --time=16:00:00
#SBATCH --account=class
#SBATCH --mem=16GB
#SBATCH --job-name=final_project_align_batch
#SBATCH --mail-type=END
#SBATCH --mail-user=jcc874@nyu.edu
#SBATCH --array=20-66

module purge
module load bwa/intel/0.7.17

#perform BWA alignment
bwa mem ./data/genome/hg19.fa ./data/ERR22623${SLURM_ARRAY_TASK_ID}_1.fastq ./data/ERR22623${SLURM_ARRAY_TASK_ID}_2.fastq > ./sam_bam_files/bwa_aligned_reads_${SLURM_ARRAY_TASK_ID}.sam