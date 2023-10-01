mkdir -p mnt
sudo mount image/vm-kernel-xtq.img mnt
cp ./fig-scripts/fig7/under/process.* mnt/parsec/pload-data-undercommit
cp ./fig-scripts/fig7/over/process.* mnt/parsec/pload-data-overcommit

cd mnt/parsec/pload-data-undercommit
./process.sh
cd -
cd mnt/parsec/pload-data-overcommit
./process.sh
cd -

mkdir -p figure-output/fig7
cp mnt/parsec/pload-data-undercommit/final.csv figure-output/fig7/under.csv
cp mnt/parsec/pload-data-overcommit/final.csv figure-output/fig7/over.csv
cp ./fig-scripts/fig7/fig7.plt figure-output/fig7/
cp ./fig-scripts/fig7/concat.py figure-output/fig7/

cd figure-output/fig7/
python3 concat.py
gnuplot ./fig7.plt
cd -

sudo umount mnt


