sudo insmod ./linux-host-ae/host-modules/pcpu_idle_table/ioctl_pcpu_idle_table.ko
sudo insmod ./linux-host-ae/host-modules/pcpu_idle_table/pcpu_idle_table.ko
sudo chmod 777 /dev/pcpu_idle_table
sudo chmod 777 /dev/ioctl_pcpu_idle_table_device
sudo swapoff -a
