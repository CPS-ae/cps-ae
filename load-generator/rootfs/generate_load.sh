#!/bin/sh

pids=""
cpus=${1:-1}
seconds=${2:-3660}
#a=( 4 9 11 34 65 23 76 13 127 100 45 67 78 15 57 68 24 25 56 67 24 18 89 69 40 50 60 70 80 90 )
echo loading $cpus CPUs for $seconds seconds
trap 'for p in $pids; do kill $p; done' 0
for i in $(seq 1 1 128); do while : ; do : ; done & pids="$pids $!"; done
# for f in "${a[@]}"; do while : ; do : ; done & pids="$pids $!"; done
sleep $seconds
