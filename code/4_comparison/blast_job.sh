#!/bin/bash -l

#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:05:00
#SBATCH -J blast_comparison
#SBATCH -o blast_comparison.output
#SBATCH -e blast_comparison.output
#SBATCH --mail-user johan.borg.2160@student.uu.se
#SBATCH --mail-type=END,FAIL

# Load module
module load bioinfo-tools blast

genome="/home/jobo2160/genome_analysis/Genome-Analysis/code/1_genome_assembly/canu/*contigs.fasta"
l_ferrooxidans="/home/jobo2160/genome_analysis/Genome-Analysis/code/4_comparison/leptospirillum_ferrooxidans.fasta"
result_folder="/home/jobo2160/genome_analysis/Genome-Analysis/code/4_comparison/results"

# Run the comparison
blastn -task blastn -query $genome -subject $l_ferrooxidans -outfmt 6 > $result_folder/comparison.crunch

exit 0
