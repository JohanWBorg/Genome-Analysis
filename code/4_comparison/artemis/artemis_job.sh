#!/bin/bash -l

#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 00:30:00
#SBATCH -J artemis_job
#SBATCH -o artemis_job.output
#SBATCH -e artemis_job.output
#SBATCH --mail-user joha.borg.2160@student.uu.se
#SBATCH --mail-type=END,FAIL

# Load modules
module load bioinfo-tools artemis

# Define files
comparison_file="/home/jobo2160/genome_analysis/Genome-Analysis/code/4_comparison/results/comparison.txt"
l_ferriphilum="/home/jobo2160/genome_analysis/Genome-Analysis/code/1_genome_assembly/canu/*contigs.fasta"
l_ferrooxidans="/home/jobo2160/genome_analysis/Genome-Analysis/code/4_comparison/leptospirillum_ferrooxidans.fasta"

# Run artemis
art $l_ferriphilum $comparison_file $l_ferrooxidans

exit 0


