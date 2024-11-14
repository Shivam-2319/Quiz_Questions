# This is a R plot for when the data is present for different categories in a single file, a little explanation regarding the arguments
# output file , both the labels and title are only given there.
#rest of the details of the code and standard input is explained in git rep

library(ggplot2)
data = read.table(file("stdin"), header = FALSE, sep = "\t", col.names = c("A","B","Category"))
args = commandArgs(trailingOnly = TRUE)
output_file = args[1]            
x_label = args[2]                 
y_label = args[3]                 
title_plt = args[4]             
plot = ggplot(data, aes(x = A, y = B, color = Category)) +
  geom_line() +                                            
  labs(title = title_plt, x = x_label, y = y_label)

ggsave(output_file,plot,width = 8,height = 6)
