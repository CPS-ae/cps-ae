#!/bin/bash

benchmarks=( "dedup" "bodytrack" "blackscholes" "fluidanimate" "vips" "streamcluster"
    "barnes"
    "ocean" "ocean-cp" "radix" )

cases=( "hvm" "pvm" "pload" )

for bench in "${benchmarks[@]}"
do
       for case in "${cases[@]}"
       do
	       filename="1-vm-32-"
	       filename+=$case
	       filename+=".log-"
	       filename+=$bench
	       echo $filename
	       egrep -o "[0-9]+m.+s" $filename | awk -F '[ms]' '{ print $1*60+$2 }' | awk 'NR % 3 == 1' > result-$case-$bench
       done
done

python3 process.py

#egrep -o "[0-9]+m.+s" 1-vm-32-pload.log \
#    | awk -F '[ms]' '{ print $1*60+$2 }' > result
#python process.py
#
#
#egrep -o "[0-9]+m.+s" 1-vm-32-hvm.log \
#    | awk -F '[ms]' '{ print $1*60+$2 }' > result
#python process.py
#
#
#egrep -o "[0-9]+m.+s" 1-vm-32-pvm.log \
#    | awk -F '[ms]' '{ print $1*60+$2 }' > result
#python process.py
