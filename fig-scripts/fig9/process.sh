rm 1vm.csv
echo ",HVM,PVM,CPS-Pload" >> 1vm.csv
echo -n "comp.," >> 1vm.csv

latest_file=$(ls -t compress-1vm/hvm* | head -1)
result=$(./compress-1vm/get_average.sh $latest_file)
float_result=$(echo "scale=3; $result/5" | bc)
echo -n $float_result >> 1vm.csv
echo -n "," >> 1vm.csv

latest_file=$(ls -t compress-1vm/pvm* | head -1)
result=$(./compress-1vm/get_average.sh $latest_file)
float_result=$(echo "scale=3; $result/5" | bc)
echo -n $float_result >> 1vm.csv
echo -n "," >> 1vm.csv

latest_file=$(ls -t compress-1vm/pload* | head -1)
result=$(./compress-1vm/get_average.sh $latest_file)
float_result=$(echo "scale=3; $result/5" | bc)
echo $float_result >> 1vm.csv

echo -n "decomp.," >> 1vm.csv
latest_file=$(ls -t decompress-1vm/hvm* | head -1)
result=$(./compress-1vm/get_average.sh $latest_file)
float_result=$(echo "scale=3; $result/5" | bc)
echo -n $float_result >> 1vm.csv
echo -n "," >> 1vm.csv

latest_file=$(ls -t decompress-1vm/pvm* | head -1)
result=$(./compress-1vm/get_average.sh $latest_file)
float_result=$(echo "scale=3; $result/5" | bc)
echo -n $float_result >> 1vm.csv
echo -n "," >> 1vm.csv

latest_file=$(ls -t decompress-1vm/pload* | head -1)
result=$(./compress-1vm/get_average.sh $latest_file)
float_result=$(echo "scale=3; $result/5" | bc)
echo $float_result >> 1vm.csv


rm 2vm.csv
echo ",HVM,PVM,CPS-Pload" >> 2vm.csv
echo -n "comp.," >> 2vm.csv

latest_file=$(ls -t compress-2vm/hvm* | head -1)
result=$(./compress-2vm/get_average.sh $latest_file)
float_result=$(echo "scale=3; $result/5" | bc)
echo -n $float_result >> 2vm.csv
echo -n "," >> 2vm.csv

latest_file=$(ls -t compress-2vm/pvm* | head -1)
result=$(./compress-2vm/get_average.sh $latest_file)
float_result=$(echo "scale=3; $result/5" | bc)
echo -n $float_result >> 2vm.csv
echo -n "," >> 2vm.csv

latest_file=$(ls -t compress-2vm/pload* | head -1)
result=$(./compress-2vm/get_average.sh $latest_file)
float_result=$(echo "scale=3; $result/5" | bc)
echo $float_result >> 2vm.csv

echo -n "decomp.," >> 2vm.csv
latest_file=$(ls -t decompress-2vm/hvm* | head -1)
result=$(./compress-2vm/get_average.sh $latest_file)
float_result=$(echo "scale=3; $result/5" | bc)
echo -n $float_result >> 2vm.csv
echo -n "," >> 2vm.csv

latest_file=$(ls -t decompress-2vm/pvm* | head -1)
result=$(./compress-2vm/get_average.sh $latest_file)
float_result=$(echo "scale=3; $result/5" | bc)
echo -n $float_result >> 2vm.csv
echo -n "," >> 2vm.csv

latest_file=$(ls -t decompress-2vm/pload* | head -1)
result=$(./compress-2vm/get_average.sh $latest_file)
float_result=$(echo "scale=3; $result/5" | bc)
echo $float_result >> 2vm.csv
