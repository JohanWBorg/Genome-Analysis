#!/bin/bash -l

#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:
#SBATCH -J trimming_l_ferriphilum_04_01
#SBATCH -o trimming_04_01.output
#SBATCH -e trimming_04_01.output
#SBATCH --mail-user johan.borg.2160@student.uu.se
#SBATCH --mail-type=END,FAIL

# Load module
module load bioinfo-tools
module load trimmomatic

code_path = "/home/jobo2160/genome_analysis/Genome-Analysis/code/4_read_trimming/"
data_path = "/home/jobo2160/genome_analysis/Genome-Analysis/data/raw/RNA/*"
adapter_path = "/home/jobo2160/genome_analysis/Genome-Analysis/data/adapter/TruSeq3-PE.fa"

for filename in $data_path; do

if $filename == *"_1"*; then

forward_file = $filename
reverse_file = ${$filename/_1/_2}

sample_name = ${$filename/$data_path/}
sample_name = ${$sample_name/_1/}


trimmomatic PE -threads 2 \
-summary $code_path"summary/$sample_name \
$forward_file \
$reverse_file \
"out_P_"$forward_file \
"out_U_"$forward_file \ 
"out_P_"$reverse_file \
"out_U_"$reverse_file \
ILLUMINACLIP:$adapter_path \
SLIDINGWINDOW:4:15

fi

done

exit 0
