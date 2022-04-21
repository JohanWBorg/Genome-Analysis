#!/bin/bash -l

#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J prokka_annotation_l_ferriphilum_05_04
#SBATCH -o prokka_annotation_05_04.output
#SBATCH -e prokka_annotation_05_04.output
#SBATCH --mail-user johan.borg.2160@student.uu.se
#SBATCH --mail-type=END,FAIL

# Load desired modules
module load bioinfo-tools
module load prokka

# Specify the output directory and the input file
output_dir="/home/jobo2160/genome_analysis/Genome-Analysis/code/3_genome_annotation/prokka/"
filename="/home/jobo2160/genome_analysis/Genome-Analysis/code/1_genome_assembly/canu/*.contigs.fasta"

# Run the prokka software
prokka --outdir $output_dir --force $filename

exit 0
