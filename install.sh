# only on arm-o AE machine
mkdir -p image
mv ~/rootfs.qcow2 image/
mv ~/vm-kernel-xtq.img image/

qemu-img create -f raw image/vm-kernel-xtq-1.img 4G
qemu-img create -f raw image/vm-kernel-xtq-2.img 4G
qemu-img create -f raw image/vm-kernel-xtq-3.img 4G
qemu-img create -f raw image/vm-kernel-xtq-4.img 4G
mkfs.ext4 image/vm-kernel-xtq-1.img
mkfs.ext4 image/vm-kernel-xtq-2.img
mkfs.ext4 image/vm-kernel-xtq-3.img
mkfs.ext4 image/vm-kernel-xtq-4.img

git clone git@github.com:CPS-ae/linux-host-ae.git
git clone git@github.com:CPS-ae/qemu-ae.git
mkdir -p mnt
sudo mount image/vm-kernel-xtq.img mnt
cd mnt
git clone git@github.com:CPS-ae/linux-guest-ae.git
cd -
sudo umount mnt

ESCAPED_REPLACE=$(printf '%s\n' "$(pwd)" | sed -e 's/[\/&]/\\&/g')
echo "$ESCAPED_REPLACE"
echo $(pwd)

sed "s/place_holder_xml/$ESCAPED_REPLACE/g" virt-xml/euler-vm4-pload.xml-template > virt-xml/euler-vm4-pload.xml
sed "s/place_holder_xml/$ESCAPED_REPLACE/g" virt-xml/euler-vm4-pload-sca.xml-template > virt-xml/euler-vm4-pload-sca.xml
sed "s/place_holder_xml/$ESCAPED_REPLACE/g" virt-xml/euler-vm4-cg.xml-template > virt-xml/euler-vm4-cg.xml


