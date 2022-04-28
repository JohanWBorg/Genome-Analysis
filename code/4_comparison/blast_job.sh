#!/bin/bash -l

#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
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

# Create database for the comparing organism
makeblastdb -in $l_ferrooxidans -parse_seqids -dbtype nucl -out leptospirillum_ferrooxidans_db

db=${l_ferrooxidans/.fasta/_db}

# Run the comparison
blastn -db $db -query $genome -out $result_folder/comparison.txt -num_threads 2

exit 0
