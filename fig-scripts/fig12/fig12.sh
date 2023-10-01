mkdir -p mnt
sudo mount image/vm-kernel-xtq.img mnt
cp ./fig-scripts/fig12/process* mnt/fxmark/

cd mnt/fxmark/
python3 ./process_CG.py over
cd -

mkdir -p figure-output/fig12
cp mnt/fxmark/over.csv figure-output/fig12

cp ./fig-scripts/fig12/fig12.plt figure-output/fig12/
cd figure-output/fig12/
gnuplot ./fig12.plt
cd -

sudo umount mnt


