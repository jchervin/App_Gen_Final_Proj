#!/bin/bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --time=1:00:00
#SBATCH --account=class
#SBATCH --mem=16GB
#SBATCH --job-name=final_project_ref_genome
#SBATCH --mail-type=END
#SBATCH --mail-user=jcc874@nyu.edu

module purge
module load bwa/intel/0.7.17

#index reference genome
bwa index ./data/genome/hg19.fa
