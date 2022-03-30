#!/bin/bash -l

#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 15:00:00
#SBATCH -J canu_assembly_03_30
#SBATCH -o assembly_03_30.output
#SBATCH -e assembly_03_30.output
#SBATCH --mail-user johan.borg.2160@student.uu.se
#SBATCH --mail-type=ALL

# Load modules
module load bioinfo-tools
module load canu/2.0

# Run the assembly for all reads
canu \
-p assembly_l_ferriphilum_03_30 \
-d /home/jobo2160/genome_analysis/Genome-Analysis/code/1_genome_assembly/canu \
genomeSize=2.4m \
-useGrid=FALSE -maxThreads=4 \
-pacbio \
/home/jobo2160/genome_analysis/Genome-Analysis/data/raw/DNA/*

exit 0
