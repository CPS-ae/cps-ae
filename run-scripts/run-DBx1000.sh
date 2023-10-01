cleanup() {
    echo "Exiting..."
    ps aux | grep qemu | awk '{print $2}' | sudo xargs kill
}

trap cleanup EXIT

./run-scripts/run-DBx1000.expect under
