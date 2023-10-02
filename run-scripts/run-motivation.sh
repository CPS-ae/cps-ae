cleanup() {
    echo "Exiting..."
    ps aux | grep qemu | awk '{print $2}' | sudo xargs kill
}

# 在脚本退出时调用 cleanup 函数
trap cleanup EXIT


sudo mount image/vm-kernel-xtq.img mnt

cd mnt/parsec/pload-data-undercommit-motivation/
sudo rm *log*
sudo rm result*
sudo ./ocean-ncp-scalable.sh-native
sudo ./streamcluster-scalable.sh-native
cd -

sudo umount mnt

./run-scripts/run-motivation.expect
