cleanup() {
    echo "Exiting..."
    ps aux | grep qemu | awk '{print $2}' | sudo xargs kill
    sudo rmmod pcpu_idle_table_test1000.ko
}

trap cleanup EXIT

./run-scripts/change-thres-under.sh

taskset -c 32-127 ./run-scripts/run-parsec.expect
