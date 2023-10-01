#!/bin/bash
sudo cp init32 rootfs/init
cd rootfs
sudo find ./ | sudo cpio -o -H newc > ../rootfs.cpio
cd -
for ((i=0; i < 4; i++)) do
    ./boot.sh 32 &
done

wait

