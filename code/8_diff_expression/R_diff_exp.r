library("DESeq2")

# Define the location of the data

output_directory = "/home/jobo2160/genome_analysis/Genome-Analysis/code/8_diff_expression/results/"

directory = "/home/jobo2160/genome_analysis/Genome-Analysis/code/7_read_counting/results/"

# Read the file as a table as structure it
sampleFiles = grep("counts",list.files(directory), value=TRUE)
sampleCondition = c("Continous","Continous","Mineral","Mineral","Continous")
sampleTable = data.frame(sampleName = sampleFiles, fileName = sampleFiles, condition = sampleCondition)

ddsHTSeq = DESeqDataSetFromHTSeqCount(sampleTable = sampleTable, directory = directory, design= ~ condition)

# Perform the differential analysis
dds = DESeq(ddsHTSeq)

# Generate a results table
res = results(dds)

# Order by the smallest P-value
resOrdered <- res[order(res$pvalue),]

# Summaries the result
summary(res)

# The number of p-values calculated to less than 0.1
sum(res$padj < 0.1, na.rm=TRUE)

# Creates another result table with an alpha value of 0.05 (default 0.1)
res05 <- results(dds, alpha=0.05)
summary(res05)
sum(res05$padj < 0.05, na.rm=TRUE)

resLFC <- lfcShrink(dds, coef="condition_Mineral_vs_Continous", type="apeglm")

png(paste(output_directory,"ma_plot.png", sep = ""))
plotMA(res, ylim=c(-2,2))
dev.off()

png(paste(output_directory,"ma_plot_LFC.png", sep = ""))
plotMA(resLFC, ylim=c(-2,2))
dev.off()

png(paste(output_directory,"plot_counts.png", sep = ""))
plotCounts(dds, gene=which.min(res$padj), intgroup="condition")
dev.off()
