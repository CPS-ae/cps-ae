#set terminal postscript "Helvetica,16" eps enhance color dl 2
reset
set terminal postscript "Helvetica, 14" eps color dashed size 3,2.4
set output "fig8.eps"

# set key right top horizontal Left reverse width 3 box 3
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
# set key autotitle columnhead
set datafile separator ","

set size 1.0, 0.65

set multiplot layout 1,2 rowsfirst
set size 0.56, 0.50
set origin 0, 0.05

set label "(a) under-committed" font "Helvetica, 12" offset 2,-3
set style histogram title offset character 0, 0, 0

set ytics 0, 10
set xtics 0, 20 font "Helvetica, 10"
set xtics offset 0,graph 0.05
set xtics center
set grid x
set grid y
set style fill solid 1.00 border -1
set style histogram clustered gap 1 title offset character 0, 0, 0
set style data histograms

set yrange [0:60]
set xrange [-10:130]
#set boxwidth 0.5 absolute

set ytics font "Helvetica, 10" 
unset key

#just y axis data is used
plot 'under.csv' using 1:($2) title "HVM" with linespoints linestyle 5 lc rgb "#4575B4" linewidth 2 pointtype 9 ps 1.0,\
     'under.csv' using 1:($3) title "PVM" with linespoints linestyle 3 lc rgb "#F46D43" linewidth 2 pointtype 13 ps 1.0, \
     'under.csv' using 1:($4) title "CPS-Pload" with linespoints linestyle 3 lc rgb "#D73027" linewidth 2 pointtype 7 ps 0.8

unset ylabel

unset label
set key autotitle columnhead
#set key inside left center horizontal Left reverse samplen 0.7 font "Helvetica, 12" width 0 box opaque
#set key outside top center horizontal Left reverse samplen 0.7 font "Helvetica, 12" width 0 box opaque
#set key horizontal Left at 140.0,48,0 reverse samplen 1.0 font "Helvetica, 12" width 1.5 box opaque
#set key horizontal Left at 140.0,48,0 reverse samplen 1.0 font "Helvetica, 12" width 1.5 box opaque maxrows 2
#set key Left at 139.5,55.5 reverse vertical height 0.2 width 1 box maxrows 2 font "Helvetica, 10"
set key Left at 115,95 reverse vertical height 0.2 width 2 box maxrows 1 font "Helvetica, 10"
set border back

set label "(b) over-committed" font "Helvetica, 12" offset 2,-3
set style histogram title offset character 0, 0, 0

set ytics 0, 10
set ytics font "Helvetica, 10" 
set xtics 0, 20 font "Helvetica, 10"
set xtics offset 0,graph 0.05
set xtics center

set size 0.50, 0.50
set origin 0.48, 0.05

set yrange [0:80]
set xrange [-10:130]

#set label "551.9(HVM, 128)" font "Helvetica, 8" offset 10,9

plot 'over.csv' using 1:($2) title "HVM" with linespoints linestyle 5 lc rgb "#4575B4" linewidth 2 pointtype 9 ps 1.0,\
     'over.csv' using 1:($3) title "PVM" with linespoints linestyle 3 lc rgb "#F46D43" linewidth 2 pointtype 13 ps 1.0,\
     'over.csv' using 1:($4) title "CPS-Pload" with linespoints linestyle 3 lc rgb "#D73027" linewidth 2 pointtype 7 ps 0.8

