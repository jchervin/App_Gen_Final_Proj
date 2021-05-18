#!/bin/bash
#SBATCH --nodes=4
#SBATCH --cpus-per-task=4
#SBATCH --time=16:00:00
#SBATCH --account=class
#SBATCH --mem=16GB
#SBATCH --job-name=indexing
#SBATCH --mail-type=END
#SBATCH --mail-user=jcc874@nyu.edu

module purge
module load picard/2.23.8
module load samtools/intel/1.11

#create sequence dictionary from the reference genome
java -jar $PICARD_JAR CreateSequenceDictionary \
R=./data/genome/hg19.fa \
O=./data/genome/hg19.dict

#index reference genome
samtools faidx ./data/genome/hg19.fa

