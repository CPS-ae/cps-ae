sudo insmod ./linux-host-ae/host-modules/pcpu_idle_table/ioctl_pcpu_idle_table.ko
sudo insmod ./linux-host-ae/host-modules/pcpu_idle_table/pcpu_idle_table.ko
sudo chmod 777 /dev/pcpu_idle_table
sudo chmod 777 /dev/ioctl_pcpu_idle_table_device
sudo swapoff -a
ESCAPED_REPLACE=$(printf '%s\n' "$(pwd)" | sed -e 's/[\/&]/\\&/g')
echo "$ESCAPED_REPLACE"
echo $(pwd)

sed "s/place_holder_xml/$ESCAPED_REPLACE/g" virt-xml/euler-vm4-pload.xml-template > virt-xml/euler-vm4-pload.xml
sed "s/place_holder_xml/$ESCAPED_REPLACE/g" virt-xml/euler-vm4-pload-sca.xml-template > virt-xml/euler-vm4-pload-sca.xml
sed "s/place_holder_xml/$ESCAPED_REPLACE/g" virt-xml/euler-vm4-cg.xml-template > virt-xml/euler-vm4-cg.xml
