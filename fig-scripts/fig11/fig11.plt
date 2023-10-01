#set terminal postscript "Helvetica,16" eps enhance color dl 2
reset
set terminal postscript "Helvetica, 14" eps color dashed size 2.3,1.8
set output "fig11.eps"

set key autotitle columnhead
set key outside box maxrows 2
# set key Left reverse width 0 samplen 1 box maxrows 1 
# set key font "Helvetica, 12" 
set key Left at 4.5, 24 reverse vertical height 0.2 width 0 box maxrows 2 font "Helvetica, 12" samplen 2

set xlabel "" offset 0,0.5 rotate by 0 font "Helvetica, 12"
set ylabel "Execution time(s)" offset 2,0 font "Helvetica, 12"
set ytics 0, 2.5
set grid x
set grid y
set datafile separator ","

set boxwidth 1.0 relative
set ytics font "Helvetica, 12" 
set xtics center rotate by -16 offset 0,-0.5 font "Helvetica, 12"

set yrange [0:20]
set xrange [-1:4]
unset bmargin
set tmargin 3
set lmargin 10

set style histogram rowstacked gap 0.3 title textcolor lt -1
set style data histograms
set style fill solid border -1
set boxwidth 0.4

plot "breakdown.csv" using 2:xtic(1)         \
         t "lock\\&unlock inode"    fs with histogram fill pattern 2 linestyle 1,\
         "breakdown.csv" using 3         \
         t "journal" fs with histogram fill pattern 9 linestyle 2,\
         "breakdown.csv" using 4         \
         t "write data"  fs with histogram fill pattern 5 linestyle 3,\
         "breakdown.csv" using 5         \
         t "other"  fs with histogram fill pattern 7 linestyle 4,
