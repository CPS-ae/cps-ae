git clone https://ipads.se.sjtu.edu.cn:1312/liuyuxuan/qemu-ae
git clone https://ipads.se.sjtu.edu.cn:1312/liuyuxuan/linux-host-ae
sudo mount image/vm-kernel-xtq.img mnt
mkdir -p mnt
cd mnt
git clone https://ipads.se.sjtu.edu.cn:1312/liuyuxuan/linux-guest-ae
cd -
sudo umount mnt



