mkdir -p mnt
sudo mount image/vm-kernel-xtq.img mnt
cp ./fig-scripts/fig10/process* mnt/fxmark/

cd mnt/fxmark/
python3 ./process_CG.py under
cd -

mkdir -p figure-output/fig10
cp mnt/fxmark/under.csv figure-output/fig10

cp ./fig-scripts/fig10/fig10.plt figure-output/fig10/
cd figure-output/fig10/
gnuplot ./fig10.plt
cd -

sudo umount mnt


