cleanup() {
    echo "Exiting..."
    ps aux | grep qemu | awk '{print $2}' | sudo xargs kill
}

trap cleanup EXIT

./run-scripts/run-fxmark-breakdown.expect
