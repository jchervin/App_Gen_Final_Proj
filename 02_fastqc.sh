#!/bin/bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --time=4:00:00
#SBATCH --account=class
#SBATCH --mem=16GB
#SBATCH --job-name=final_project_fastqc
#SBATCH --mail-type=END
#SBATCH --mail-user=jcc874@nyu.edu
#SBATCH --array=20-66

module purge
module load fastqc/0.11.9

fastqc ./data/ERR22623${SLURM_ARRAY_TASK_ID}_1.fastq ./data/ERR22623${SLURM_ARRAY_TASK_ID}_2.fastq -o ./data/fastqc
