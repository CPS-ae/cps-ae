mkdir -p mnt
sudo mount image/vm-kernel-xtq.img mnt
cp ./fig-scripts/fig13/process* mnt/DBx1000/

cd mnt/DBx1000/
./process.sh
cd -

mkdir -p figure-output/fig13
cp mnt/DBx1000/*.csv figure-output/fig13

cp ./fig-scripts/fig13/fig13.plt figure-output/fig13/
cd figure-output/fig13/
gnuplot ./fig13.plt
cd -

sudo umount mnt


