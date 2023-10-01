mkdir -p mnt
sudo mount image/vm-kernel-xtq.img mnt
cp ./fig-scripts/fig9/process.* mnt/lbzip2/eval

cd mnt/lbzip2/eval/
./process.sh
cd -

mkdir -p figure-output/fig9
cp mnt/lbzip2/eval/*.csv figure-output/fig9

cp ./fig-scripts/fig9/fig9.plt figure-output/fig9/
cd figure-output/fig9/
gnuplot ./fig9.plt
cd -

sudo umount mnt


