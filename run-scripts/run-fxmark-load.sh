
cleanup() {
    echo "Exiting..."
    ps aux | grep qemu | awk '{print $2}' | sudo xargs kill
}
trap cleanup EXIT

./run-scripts/generate-load.sh 64

./run-scripts/run-fxmark.expect over

