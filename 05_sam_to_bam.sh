#!/bin/bash
#SBATCH --nodes=4
#SBATCH --cpus-per-task=4
#SBATCH --time=16:00:00
#SBATCH --account=class
#SBATCH --mem=16GB
#SBATCH --job-name=final_project_sam2bam
#SBATCH --mail-type=END
#SBATCH --mail-user=jcc874@nyu.edu
#SBATCH --array=20-66

module purge
module load samtools/intel/1.11

#sort sam
samtools sort ./sam_bam_files/bwa_aligned_reads_${SLURM_ARRAY_TASK_ID}.sam -o ./sam_bam_files/bwa_aligned_reads_${SLURM_ARRAY_TASK_ID}_sorted.sam

#convert to bam
samtools view -S -b ./sam_bam_files/bwa_aligned_reads_${SLURM_ARRAY_TASK_ID}_sorted.sam > ./sam_bam_files/bwa_aligned_reads_${SLURM_ARRAY_TASK_ID}_sorted.bam

#flagstat
samtools flagstat ./sam_bam_files/bwa_aligned_reads_${SLURM_ARRAY_TASK_ID}_sorted.bam > ./results/flagstat_outputs/flagstat_output_${SLURM_ARRAY_TASK_ID}.txt