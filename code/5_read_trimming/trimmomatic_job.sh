#!/bin/bash -l

#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 04:00:00
#SBATCH -J trimming_l_ferriphilum_08_04
#SBATCH -o trimming.output
#SBATCH -e trimming.output
#SBATCH --mail-user johan.borg.2160@student.uu.se
#SBATCH --mail-type=END,FAIL

# Load module
module load bioinfo-tools
module load trimmomatic/0.36

code_path="/home/jobo2160/genome_analysis/Genome-Analysis/code/5_read_trimming/"
data_path="/home/jobo2160/genome_analysis/Genome-Analysis/data/raw/RNA/"
adapter_path="$TRIMMOMATIC_HOME/adapters/TruSeq2-PE.fa"

for filename in $data_path*; do

if [[ "$filename" == *"_1"* ]]; then

forward_file=$filename	
reverse_file=${filename/_1/_2}

sample_file=${filename/$data_path/}
sample_name=${sample_file/_1*/}

trimmomatic PE -phred33 $forward_file $reverse_file \
"${code_path}"results/"${sample_file/_1/_1P}" "${code_path}"results/"${sample_file/_1/_1U}" "${code_path}"results/"${sample_file/_1/_2P}" "${code_path}"results/"${sample_file/_1/_2U}" \
ILLUMINACLIP:$adapter_path:2:30:10 \
SLIDINGWINDOW:4:15 \
LEADING:3 TRAILING:3 MINLEN:40 MAXINFO:40:0.5

fi

done

exit 0
