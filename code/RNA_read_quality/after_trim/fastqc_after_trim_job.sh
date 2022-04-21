#!/bin/bash -l

#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J FastQC_after_trim
#SBATCH -o FastQC_after_trim.output
#SBATCH -e FastQC_after_trim.output
#SBATCH --mail-user johan.borg.2160@student.uu.se
#SBATCH --mail-type=END,FAIL

# Load needed modules
module load bioinfo-tools FastQC

# Define paths
data_path="/home/jobo2160/genome_analysis/Genome-Analysis/code/5_read_trimming/results/*"
output_path="/home/jobo2160/genome_analysis/Genome-Analysis/code/RNA_read_quality/after_trim/results"

# Run fastqc
fastqc -t 2 $data_path -o $output_path 

exit 0
