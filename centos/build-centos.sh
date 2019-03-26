export centos_root='/tmp/centos_image/rootfs'
mkdir -p $centos_root
rpm --root $centos_root --initdb
yum reinstall --downloadonly --downloaddir . centos-release
rpm --root $centos_root -ivh --nodeps centos-release*.rpm
rpm --root $centos_root --import  $centos_root/etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
yum -y --installroot=$centos_root --setopt=tsflags='nodocs' --setopt=override_install_langs=en_US.utf8 install yum
sed -i "/distroverpkg=centos-release/a override_install_langs=en_US.utf8\ntsflags=nodocs" $centos_root/etc/yum.conf
chroot to the environment and install some additional tools
cp /etc/resolv.conf $centos_root/etc
mount the device tree, as its required by some programms
mount -o bind /dev $centos_root/dev
chroot $centos_root /bin/bash <<EOF
yum install -y procps-ng iputils
yum clean all
EOF
rm -f $centos_root/etc/resolv.conf
umount $centos_root/dev
tar -C $centos_root -c . | docker import - centos-base
