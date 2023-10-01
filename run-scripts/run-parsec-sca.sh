cleanup() {
    echo "Exiting..."
    ps aux | grep qemu | awk '{print $2}' | sudo xargs kill
}

# 在脚本退出时调用 cleanup 函数
trap cleanup EXIT
./run-scripts/change-thres-under.sh
./run-scripts/run-parsec-sca.expect
