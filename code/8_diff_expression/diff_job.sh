#!/bin/bash -l

#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 00:10:00
#SBATCH -J diff_exp
#SBATCH -o diff_exp.output
#SBATCH -e diff_exp.output
#SBATCH --mail-user johan.borg.2160@student.uu.se
#SBATCH --mail-type=END,FAIL

# Load the required modules
module load bioinfo-tools R R_packages

htseqData="/home/jobo2160/genome_analysis/Genome-Analysis/code/7_read_counting/results"
filenameData="/home/jobo2160/genome_analysis/Genome-Analysis/data/raw/RNA/*"

n=2
for filename in $filenameData; do
if [[ "$filename" == *"_1"* ]]; then

output=${filename/_1*/}
output=${output##*/}

cut -f 1,$n $htseqData/htseq_result.txt > $htseqData/${output}_counts.txt

((n=n+1))


fi
done

# Define the path to the R script that will run the process
script="/home/jobo2160/genome_analysis/Genome-Analysis/code/8_diff_expression/R_diff_exp.r"

Rscript $script

exit 0



