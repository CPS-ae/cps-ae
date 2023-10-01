#!/bin/bash

benchmarks=( "WAIT_DIE" "NO_WAIT" )
cases=( "over" "under" )
number=( "single" "multiple" )

for case in "${cases[@]}"
do
       rm $case.csv
       echo "Improvement,4 threads,128 threads" >> $case.csv
       for bench in "${benchmarks[@]}"
       do
               echo -n "$bench," >> $case.csv
	       for num in "${number[@]}"
	       do
	               filename="all-"
		       filename+=$num
		       filename+="-"  
	               filename+=$bench
	               filename_base=$filename
	               filename_cg=$filename
	               filename_base+="-baseline-"
	               filename_cg+="-cg-"
	               filename_base+=$case
	               filename_cg+=$case
	               echo $filename_base $filename_cg
                       result_base=$(cat $filename_base | cut -d " " -f 2 | awk '{s+=$1} END {print s}')
	               result_cg=$(cat $filename_cg | cut -d " " -f 2 | awk '{s+=$1} END {print s}')
	               echo $result_base $result_cg
		       float_result=$(echo "scale=5; ($result_base-$result_cg)/$result_cg" | bc)
		       final=$(printf "%.5f\n" $float_result)
		       echo $final
                       echo -n $final >> $case.csv
                       echo -n "," >> $case.csv
               done
	       sed '$ s/.$//' $case.csv > temp.csv
	       mv temp.csv $case.csv
	       echo "" >> $case.csv
        done
done

