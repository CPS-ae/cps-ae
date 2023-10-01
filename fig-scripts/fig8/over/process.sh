#!/bin/bash

bench="ocean-cp"
cases=( "hvm" "pvm" "pload" )
for case in "${cases[@]}"
do
    rm result-$case-$bench
done
for (( i=4; i<=128; i*=2 ))
do
    for case in "${cases[@]}"
    do
	       filename="1-vm-"
           filename+=$i
           filename+="-"
	       filename+=$case
	       filename+=".log-"
	       filename+=$bench
	       echo $filename
	       egrep -o "[0-9]+m.+s" $filename | awk -F '[ms]' '{ print $1*60+$2 }' | awk 'NR == 1' >> result-$case-$bench
    done
done

python3 process.py

data=$(sed -n '2p' ocean-cp_4_to_128.csv)
sed "2i$data" ocean-cp_4_to_128.csv > ocean-cp.csv

