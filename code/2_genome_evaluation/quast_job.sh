#!/bin/bash -l

#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 01:00:00
#SBATCH -J quast_evaluation_l_ferriphilum_05_04
#SBATCH -o quast_05_04.output
#SBATCH -e quast_05_04.output
#SBATCH --mail-user johan.borg.2160@student.uu.se
#SBATCH --mail-type=END,FAIL

# Load desired modules
module load bioinfo-tools
module load quast

# Specify the output directory
output_dir="/home/jobo2160/genome_analysis/Genome-Analysis/code/2_genome_evaluation/quast"

# Run the quast command on the given file
filename="/home/jobo2160/genome_analysis/Genome-Analysis/code/1_genome_assembly/canu/*contigs.fasta"

quast.py -o $output_dir $filename

exit 0
