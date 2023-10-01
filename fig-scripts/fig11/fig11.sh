mkdir -p mnt
sudo mount image/vm-kernel-xtq.img mnt
cp ./fig-scripts/fig11/process* mnt/fxmark-breakdown/

cd mnt/fxmark-breakdown/
./process.sh
cd -

mkdir -p figure-output/fig11
cp mnt/fxmark-breakdown/breakdown.csv figure-output/fig11

cp ./fig-scripts/fig11/fig11.plt figure-output/fig11/
cd figure-output/fig11/
gnuplot ./fig11.plt
cd -

sudo umount mnt


