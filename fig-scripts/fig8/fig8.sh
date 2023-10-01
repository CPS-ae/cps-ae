mkdir -p mnt
sudo mount image/vm-kernel-xtq.img mnt
cp ./fig-scripts/fig8/under/process.* mnt/parsec/pload-data-undercommit-scalability
cp ./fig-scripts/fig8/over/process.* mnt/parsec/pload-data-overcommit-scalability

cd mnt/parsec/pload-data-undercommit-scalability
./process.sh
cd -
cd mnt/parsec/pload-data-overcommit-scalability
./process.sh
cd -

mkdir -p figure-output/fig8
cp mnt/parsec/pload-data-undercommit-scalability/ocean-cp.csv figure-output/fig8/under.csv
cp mnt/parsec/pload-data-overcommit-scalability/ocean-cp.csv figure-output/fig8/over.csv
cp ./fig-scripts/fig8/fig8.plt figure-output/fig8/

cd figure-output/fig8/
gnuplot ./fig8.plt
cd -

sudo umount mnt


