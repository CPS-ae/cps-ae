#!/bin/bash


benchmarks=( "streamcluster" "ocean-ncp" )
cases=( "hvm" "pvm" "native" )
for bench in "${benchmarks[@]}"
do
    for case in "${cases[@]}"
    do
        rm result-$case-$bench
    done
done

for bench in "${benchmarks[@]}"
do
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
done
python3 process.py


data=$(sed -n '2p' ocean-ncp_4_to_128.csv)
sed "2i$data" ocean-ncp_4_to_128.csv > ocean-ncp.csv

data=$(sed -n '2p' streamcluster_4_to_128.csv)
sed "2i$data" streamcluster_4_to_128.csv > streamcluster.csv
