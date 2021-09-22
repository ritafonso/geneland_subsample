##this script is used to susample loci from a geneland or genepop file

args <- commandArgs(trailingOnly = TRUE)

directory <- agrs[1]
input_file <- args[2]
total_loci <- args[3]
output_file <- args[4]
subsample_loci <- args[5]


#directory of the analysis
setwd(directory)

#vetor should start in 0 and end in the number of the total loci
nr_loci <- c(0:total_loci)


#size should be the number of loci we want to subsample
subsample <- sample(nr_loci,size=subsample_loci, replace = F)


#create a list where the same loci has two colums
loci_list <- c(subsample*2,subsample*2+1)
#sort the list so that the two columns of each loci are together
loci_list_sorted <- sort(loci_list)

#input the geneland file
geneland <- read.table(input_file, header=F)

#subsample our file and export
subsample_real <- geneland[,loci_list_sorted]
write.table(subsample_real,output_file)
