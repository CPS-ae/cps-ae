cleanup() {
    echo "Exiting..."
    ps aux | grep qemu | awk '{print $2}' | sudo xargs kill
}

# 在脚本退出时调用 cleanup 函数
trap cleanup EXIT

./run-scripts/generate-load.sh 64

./run-scripts/run-DBx1000.expect over
