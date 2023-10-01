#set terminal postscript "Helvetica,16" eps enhance color dl 2
reset
set terminal postscript "Helvetica, 12" eps color dashed size 4.5 ,1.0
#set terminal postscript "Helvetica, 14" eps color dashed size 4,2
set output "fig7.eps"

unset origin

set grid x
set grid y
set style fill solid 1.00 border -1
set style data histograms
set datafile separator ","

set ytics 0, 1.0
set yrange [0:2]

set rmargin 4
set lmargin 5

set style histogram clustered gap 1
set boxwidth 0.7 relative

set multiplot layout 2,1 rowsfirst
set size 1.,0.45
#origin: plot x y
set origin 0.00, 0.50
set ytics 1, 1
set yrange [3.0:5.2]

set title "The benefits of PIdle Enhancement in one VM and two VM scenario" font "Helvetica, 15" offset 0,0.3
unset title

set style histogram title offset character 0, 0, 0

#set xrange [-1:12]
#xtick start to affect
unset xlabel
set ylabel " " offset 1,0

# set xrange [-1:12]
unset xrange
set xtics 0, 1
#xtick start to affect
set xtics format " "


set key autotitle columnhead
#set key inside right top horizontal Left reverse samplen 0.5 font "Helvetica, 12" width 0 box opaque
set key outside right top horizontal Left reverse samplen 2.0 font "Helvetica, 10" width 2 height 0.2 box opaque
set border back
set ytics font "Helvetica, 8" 
set style histogram errorbars lw 1

#just y axis data is used
plot 'pload-arm.csv' using 2:($3*2) with histogram fill pattern 2 linestyle 1 , \
             '' using 4:($5*2) with histogram fill pattern 9 linestyle 2 , \
             '' using 6:($7*2) with histogram fill pattern 5 linestyle 3 , \
             '' using 8:($9*2) with histogram fill pattern 7 linestyle 4 , \

unset title
unset key
set origin 0, 0.30
set size 1.0 ,0.001
set yrange [-0.2:1.6]
set ytics 0, 0.3

#set xtics center
set xtics left
set xtics font "Helvetica, 8"
#set xtics rotate by -45 left offset 0,0
set xtics rotate by -16 center offset 0,-0.4
set xtics 0, 1

set xlabel "" font "Helvetica, 12" offset 0,5.5
set ylabel "Improvement" font "Helvetica, 12" offset 2.5,1.3

set label "1.89" at 2.9,1.7 font "Helvetica, 8" center offset 0,0.05
set label "6.51" at 0.1,2.3 font "Helvetica, 8" center offset 0,0.05

set arrow from graph 0,first 0.0 to graph 1,first 0.0 nohead lc rgb "#000000" front
plot 'pload-arm.csv' using 2:($3*2):xtic(1) with histogram fill pattern 2 linestyle 1, \
          '' using 4:($5*2):xtic(1)  with histogram fill pattern 9 linestyle 2 , \
          '' using 6:($7*2):xtic(1)  with histogram fill pattern 5 linestyle 3 , \
          '' using 8:($9*2):xtic(1)  with histogram fill pattern 7 linestyle 4 , 
