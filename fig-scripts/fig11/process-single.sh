name=$1

percentage=$(grep ext4_file_write_iter ${name}-result | awk 'NR==1' | grep -o '[^ ]*%' | tr -d '-' | tr -d '|')
number=$(echo $percentage | sed 's/%//')
decimal=$(echo "scale=6; $number / 100" | bc)
echo $decimal
base=$decimal
other=$(echo "1 - $base" | bc)
echo $other

percentage=$(grep __ext4_journal_start_sb ${name}-result | awk 'NR==1' | grep -o '[^ ]*%' | tr -d '-' | tr -d '|')
number=$(echo $percentage | sed 's/%//')
decimal=$(echo "scale=6; $number / 100" | bc)
echo $decimal
journal_begin=$decimal

percentage=$(grep __ext4_journal_stop ${name}-result | awk 'NR==1' | grep -o '[^ ]*%' | tr -d '-' | tr -d '|')
number=$(echo $percentage | sed 's/%//')
decimal=$(echo "scale=6; $number / 100" | bc)
echo $decimal
journal_end=$decimal

percentage=$(grep __arch_copy_from_user ${name}-result | awk 'NR==1' | grep -o '[^ ]*%' | tr -d '-' | tr -d '|')
number=$(echo $percentage | sed 's/%//')
decimal=$(echo "scale=6; $number / 100" | bc)
echo $decimal
write_only=$decimal

journal=$(echo "scale=6; $journal_begin + $journal_end" | bc)
inode=$(echo "scale=6; $base - $journal - $write_only" | bc)

echo $inode
echo $journal
echo $write_only
echo $other


fxtime=$(grep '^4' ${name}-value | awk 'NR==1' |  cut -d' ' -f2)
echo time $fxtime
inodetime=$(echo "scale=6; $inode * $fxtime" | bc)
journaltime=$(echo "scale=6; $journal * $fxtime" | bc)
write_onlytime=$(echo "scale=6; $write_only * $fxtime" | bc)
othertime=$(echo "scale=6; $other * $fxtime" | bc)
echo $inodetime
echo $journaltime
echo $write_onlytime
echo $othertime


echo -n $name >> breakdown.csv
echo -n "," >> breakdown.csv
echo -n $inodetime >> breakdown.csv
echo -n "," >> breakdown.csv
echo -n $journaltime >> breakdown.csv
echo -n "," >> breakdown.csv
echo -n $write_onlytime >> breakdown.csv
echo -n "," >> breakdown.csv
echo -n $othertime >> breakdown.csv
echo "" >> breakdown.csv



