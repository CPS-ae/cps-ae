sudo cp init64 rootfs/init
cd rootfs
sudo find ./ | sudo cpio -o -H newc > ../rootfs.cpio
cd -

./boot.sh 64 &

wait

