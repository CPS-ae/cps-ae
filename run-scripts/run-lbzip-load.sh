cleanup() {
    echo "Exiting..."
    ps aux | grep qemu | awk '{print $2}' | sudo xargs kill
}

trap cleanup EXIT
./run-scripts/change-thres-over.sh
./run-scripts/generate-load.sh 32

./run-scripts/run-lbzip-load.expect
