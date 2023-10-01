# install host guest kernel
cp config/host-config linux-host-ae/.config

cd linux-host-ae
./build.sh
cd -

cd linux-host-ae/host-modules/pcpu_idle_table/
make -j
cd -

sudo cp config/grub /etc/default/grub
sudo update-grub
