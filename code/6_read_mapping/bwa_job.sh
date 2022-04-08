#!/bin/bash -l

#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 08:00:00
#SBATCH -J bwa_mapping_08_04
#SBATCH -o bwa_output_08_04.output
#SBATCH -e bwa_output_08_04.output
#SBATCH --mail-user johan.borg.2160@student.uu.se
#SBATCH --mail-type=END,FAIL

# Load modules
module load bioinfo-tools bwa samtools

# Define paths
data_path="/home/jobo2160/genome_analysis/Genome-Analysis/code/5_read_trimming/results/"
output="/home/jobo2160/genome_analysis/Genome-Analysis/code/6_read_mapping/results"
genome_path="/home/jobo2160/genome_analysis/Genome-Analysis/code/1_genome_assembly/canu/assembly_l_ferriphilum_03_30.contigs.fasta"

for filename in $data_path*; do

if [[ "$filename" == *"1P"* ]]; then

left_read=$filename
right_read=${filename/1P/2P}

file_id=${filename/$data_path/}
file_id=${file_id/.fastq.gz/}

bwa index $genome_path
bwa mem -t 4 $genome_path $left_read $right_read | samtools -o $output/${file_id}.bam

fi
done

exit 0
