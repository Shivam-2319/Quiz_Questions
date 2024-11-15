set terminal postscript eps enhanced color font "Helvetica,14" size 3,5

set output output_file

set title "<80 bp"
set ylabel "CTCF ChIP peaks with motif" font ",14"

set xtics ("-1 kb" -1000, "0" 0, "+1 kb" 1000)
set ytics ("0" 0, "20k" 20000, "40k" 40000, "60k" 60000, "80k" 80000, "100k" 100000)

set palette defined (0 "white", 1 "pink", 1.5 "light-red", 2 "dark-red")

unset grid
set colorbox

plot input_file matrix with image notitle

set output
