#set terminal postscript "Helvetica,16" eps enhance color dl 2
reset
set terminal postscript "Helvetica, 14" eps color dashed size 2.2,1.5
#set terminal postscript "Helvetica, 14" eps color dashed size 4,2
set output "fig13.eps"

unset origin

set grid x
set grid y
set style fill solid 1.00 border -1
set style data histograms
set datafile separator ","

set ytics 0, 1.0

set style histogram clustered gap 1.0
set boxwidth 0.8 relative

#set title "PIdle Enhancement to lbzip2 in one VM scenario" font "Helvetica, 15" offset 0,0.3
set style histogram title offset character 0, 0, 0

#set key inside right top horizontal Left reverse samplen 0.5 font "Helvetica, 12" width 0 box opaque
set border back
set ytics font "Helvetica, 10" 

set xlabel "" font "Helvetica, 12" offset 0,5.5
set ylabel "Improvement" font "Helvetica, 12" offset 1,0 

unset xlabel

set ylabel "Improvement" font "Helvetica, 10" offset 1,0 

set grid x
set grid y
set style fill solid 1.00 border -1
set style histogram clustered gap 1.5 title offset character 0, 0, 0
set style data histograms
set datafile separator ","
# set title "the performance comparison on PARSEC between PV and Patched(need PV and no-PV)"

#set boxwidth 0.5 absolute
#set xtics rotate by -10 center offset 0,-1
unset bmargin
set key autotitle columnhead
set datafile separator ","

set size 1.0, 0.7

set xtics center
set xtics font "Helvetica, 8"
set xtics rotate by 0 offset 0,0.5
set xtics 0, 1

set multiplot layout 1,2 rowsfirst
set size 0.55, 0.6
set origin 0, 0

set style histogram title offset character 0, 0, 0

set grid x
set grid y
set style fill solid 1.00 border -1
set style histogram clustered gap 1 title offset character 0, 0, 0
set style data histograms

#set boxwidth 0.5 absolute

set ytics font "Helvetica, 10" 
set yrange [0:1.2]
set ytics 0, 0.2
unset key
unset label
set xtics rotate by -16 center offset 0,-0.1
#set key vertical Left at 1.9,2.7 reverse samplen 1.2 height 0.3 font "Helvetica, 5" width 0 box opaque

#just y axis data is used
plot newhistogram "", \
     'under.csv' using 2:xtic(1) title col with histogram fill pattern 2 linestyle 1, \
     ''      using 3:xtic(1) title col with histogram fill pattern 9 linestyle 2, \

unset ylabel

set label "(a) DBx1000-1-vm" font "Helvetica, 9" offset -18.5,-1.6
set label "(b) DBx1000-2-vm" font "Helvetica, 9" offset -2.5,-1.6
set style histogram title offset character 0, 0, 0

set ytics font "Helvetica, 10" 
#set xtics 0, 20 font "Helvetica, 10"

set size 0.55, 0.6
set origin 0.45, 0

set yrange [0:1.2]
set ytics 0, 0.2
set key autotitle columnhead

set xtics rotate by -16 center offset 0,-0.1
#set key horizontal Left at -2.0, 5 height 0.3 width -0 box maxrows 1 font "Helvetica, 9"
set key Left at 1.5, 1.5 reverse vertical height 0.2 width 0 box maxrows 1 font "Helvetica, 10" samplen 1.5

plot newhistogram "", \
     'over.csv' using 2:xtic(1) title col with histogram fill pattern 2 linestyle 1, \
     ''      using 3:xtic(1) title col with histogram fill pattern 9 linestyle 2, \


