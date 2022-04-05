#!/bin/bash -l

#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n number of cores
#SBATCH -t HH:MM:SS
#SBATCH -J prokka_annotation_l_ferriphilum_05_04
#SBATCH -o prokka_annotation_05_04.output
#SBATCH -e prokka_annotation_05_04.output
#SBATCH --mail-user johan.borg.2160@student.uu.se
#SBATCH --mail-type=END,FAIL

# Load desired modules
module load bioinfo-tools
module load prokka

exit 0
