sudo mount image/vm-kernel-xtq.img mnt
cp ./fig-scripts/fig1/process.* mnt/parsec/pload-data-undercommit-motivation
cp ./fig-scripts/fig1/fig1.plt mnt/parsec/pload-data-undercommit-motivation
cd mnt/parsec/pload-data-undercommit-motivation
./process.sh
gnuplot fig1.plt
cd -
mkdir -p figure-output/fig1
cp mnt/parsec/pload-data-undercommit-motivation/fig1.eps ./figure-output/fig1/
sudo umount mnt

