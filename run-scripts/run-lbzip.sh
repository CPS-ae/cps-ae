cleanup() {
    echo "Exiting..."
    ps aux | grep qemu | awk '{print $2}' | sudo xargs kill
}

trap cleanup EXIT
./run-scripts/change-thres-under.sh

./run-scripts/run-lbzip.expect
