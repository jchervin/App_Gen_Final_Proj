#!/bin/bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --time=4:00:00
#SBATCH --account=class
#SBATCH --mem=16GB
#SBATCH --job-name=final_project_download_data
#SBATCH --mail-type=END
#SBATCH --mail-user=jcc874@nyu.edu
#SBATCH --array=20-66

module purge
module load sra-tools/2.10.9

fasterq-dump --split-files ERR22623${SLURM_ARRAY_TASK_ID} -O ./data
