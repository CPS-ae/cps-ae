# only on arm-o AE machine
mv ~/rootfs.qcow2 image/
mv ~/vm-kernel-xtq.img image/

qemu-img create -f raw image/vm-kernel-xtq-1.img 4G
qemu-img create -f raw image/vm-kernel-xtq-2.img 4G
qemu-img create -f raw image/vm-kernel-xtq-3.img 4G
qemu-img create -f raw image/vm-kernel-xtq-4.img 4G
mkfs.ext4 image/vm-kernel-xtq-1.img
mkfs.ext4 image/vm-kernel-xtq-2.img
mkfs.ext4 image/vm-kernel-xtq-3.img
mkfs.ext4 image/vm-kernel-xtq-4.img

git clone https://github.com/CPS-ae/linux-host-ae.git
git clone https://github.com/CPS-ae/qemu-ae.git
sudo mount image/vm-kernel-xtq.img mnt
mkdir -p mnt
cd mnt
git clone https://github.com/CPS-ae/linux-guest-ae.git
cd -
sudo umount mnt



