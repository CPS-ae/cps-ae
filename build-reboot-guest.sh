# install host guest kernel
sudo mount image/vm-kernel-xtq.img mnt
cp config/guest-config mnt/linux-guest-ae/.config
sudo umount mnt

./build-reboot-guest.expect
