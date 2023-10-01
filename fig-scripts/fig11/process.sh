rm breakdown.csv
echo 'config,"lock/unlock inode",journal,"write page",other' > breakdown.csv
./process-single.sh diff-socket
./process-single.sh same-socket
./process-single.sh same-numa
./process-single.sh same-cg
