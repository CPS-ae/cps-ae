reset
set terminal postscript "Helvetica, 12" eps color dashed size 4.5 ,1.0
set output "fig12.eps"

unset origin

set grid x
set grid y
set style fill solid 1.00 border -1
set style data histograms
set datafile separator ","

set rmargin 4
set lmargin 5

set style histogram clustered gap 1
set boxwidth 0.7 relative

set size 0.4,0.8
set origin 0.00, 0.50

set ytics 0.2
set yrange [0:2.1]

set style histogram title offset character 0, 0, 0

set key autotitle columnhead
unset xlabel

set key outside right top horizontal Left reverse samplen 2.0 font "Helvetica, 7" width 0 height 0.2 box opaque
set border back
set ytics font "Helvetica, 8" 

set xtics left
set xtics font "Helvetica, 7"
set xtics rotate by -20 center offset 0,-0.12
set xtics 0, 1

set ylabel "Improvement" font "Helvetica, 8" offset 2.6,0.

#just y axis data is used
plot 'over.csv' using 2:xtic(1) with histogram fill pattern 2 linestyle 1 , \
             '' using 3 with histogram fill pattern 9 linestyle 2 , \

