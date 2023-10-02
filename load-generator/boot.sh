sudo    qemu-system-aarch64 \
  -machine virt-4.0,accel=kvm,usb=off,dump-guest-core=off,gic-version=3 \
  --enable-kvm \
  -cpu host \
  -nographic -smp $1 \
  -kernel Image \
  --initrd rootfs.cpio \
  -append "console=ttyAMA0 root=/dev/vda oops=panic panic_on_warn=1 panic=-1 ftrace_dump_on_oops=orig_cpu debug earlyprintk=serial slub_debug=UZ" \
  -m 2048
