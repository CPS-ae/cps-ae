#set terminal postscript "Helvetica,16" eps enhance color dl 2
reset
set terminal postscript "Helvetica, 14" eps color dashed size 3,2.4
set output "fig1.eps"

#set key right top horizontal Left reverse width 3 box 3
set xlabel "#threads" font "Helvetica, 12" offset 0,0.5 
set ylabel "Execution time (s)" font "Helvetica, 12" offset 2,0 
#set mytics 5
set grid x
set grid y
set style fill solid 1.00 border -1
set style histogram clustered gap 1 title offset character 0, 0, 0
set style data histograms
set datafile separator ","
# set title "comparison of PARSEC performance with and without pvsched"

#
#set boxwidth 0.5 absolute
#set xtics rotate by -10 center offset 0,-1
unset bmargin
set datafile separator ","

set size 1.0, 0.7

set multiplot layout 1,2 rowsfirst
set size 0.56, 0.55
set origin 0, 0.05

set label "(a) streamcluster" font "Helvetica, 12" offset 2.5,-3
set style histogram title offset character 0, 0, 0

set ytics 0, 80
set xtics 0, 20 font "Helvetica, 10"
set xtics center
set grid x
set grid y
set style fill solid 1.00 border -1
set style histogram clustered gap 1 title offset character 0, 0, 0
set style data histograms

set yrange [0:800]
set xrange [-10:140]
#set boxwidth 0.5 absolute

set ytics font "Helvetica, 10" 
unset key

#just y axis data is used
plot 'streamcluster.csv' using 1:($2) title "HVM" with linespoints linestyle 5 lc rgb "#4575B4" linewidth 2 pointtype 9 ps 1.0,\
     'streamcluster.csv' using 1:($3) title "PVM" with linespoints linestyle 3 lc rgb "#F46D43" linewidth 2 pointtype 13 ps 1.0, \
     'streamcluster.csv' using 1:($4) title "Native" with linespoints linestyle 3 lc rgb "#D73027" linewidth 2 pointtype 7 ps 0.8

unset ylabel

unset label
set key autotitle columnhead
set key Left at 80,185 reverse vertical height 0.2 width 1 box maxrows 1 font "Helvetica, 10"
set border back

set label "(b) splash2x.ocean\\\_ncp" font "Helvetica, 12" offset 0,-3
set style histogram title offset character 0, 0, 0

set ytics 0, 20
set ytics font "Helvetica, 10" 
set xtics 0, 20 font "Helvetica, 10"
set xtics center

set size 0.50, 0.55
set origin 0.48, 0.05

set yrange [0:160]
set xrange [-10:140]

plot 'ocean-ncp.csv' using 1:($2) title "HVM" with linespoints linestyle 5 lc rgb "#4575B4" linewidth 2 pointtype 9 ps 1.0,\
     'ocean-ncp.csv' using 1:($3) title "PVM" with linespoints linestyle 3 lc rgb "#F46D43" linewidth 2 pointtype 13 ps 1.0,\
     'ocean-ncp.csv' using 1:($4) title "Native" with linespoints linestyle 3 lc rgb "#D73027" linewidth 2 pointtype 7 ps 0.8
