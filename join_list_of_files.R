# This file takes a list of files as input from an argument vector , to see the content of file data/list_q3.tsv use this command on the terminal 
# cat data/list_q3.tsv
# output:
# data/q3_first.tsv
# data/q3_second.tsv
# Working of this code:
# This code takes the file(list_q3.tsv) as input which holds the path to the files which have to be merged, it return a stdout which is saved into join_output.tsv
# The files are merged on the common values in the first column of the files

library(readr)
library(dplyr)

args = commandArgs(trailingOnly = TRUE)

file_list = read_lines(args[1])

merged_data = read_tsv(file_list[1],col_names = FALSE)

for (file in file_list[-1]){
	current_data = read_tsv(file,col_names = FALSE)
	merged_data = inner_join(merged_data,current_data,by = names(merged_data)[1])
	}
write_tsv(merged_data,col_names = FALSE ,stdout())

