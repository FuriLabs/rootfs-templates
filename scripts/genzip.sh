#!/bin/bash
ROOTFS_PATH=$(find . -maxdepth 1 -mindepth 1 -type d -name .debos-*)/root
ROOTFS_SIZE=$(du -sm $ROOTFS_PATH | awk '{ print $1 }')

ZSTD_NAME=$1
IMG_SIZE=$(( ${ROOTFS_SIZE} + 250 )) # FIXME 250MB contingency
IMG_MOUNTPOINT=".image"

# create root img
echo "Creating an empty root image"
dd if=/dev/zero of=rootfs.img bs=1M count=${IMG_SIZE}
mkfs.ext4 -O ^metadata_csum -O ^64bit -F rootfs.img

# mount the image
echo "Mounting root image"
mkdir -p $IMG_MOUNTPOINT
mount -o loop rootfs.img ${IMG_MOUNTPOINT}

# copy rootfs content
echo "Syncing rootfs content"
rsync --archive -H -A -X $ROOTFS_PATH/* ${IMG_MOUNTPOINT}
rsync --archive -H -A -X $ROOTFS_PATH/.[^.]* ${IMG_MOUNTPOINT}
sync

# umount the image
echo "umount root image"
umount $IMG_MOUNTPOINT

DEBIAN_FRONTEND=noninteractive apt-get install -y zstd

# generate flashable zstd
echo "Generating zstd archive"
mv rootfs.img android-recovery-flashing-template/data/rootfs.img

rm -rf android-recovery-flashing-template/.git
rm -rf android-recovery-flashing-template/README.md
rm -rf android-recovery-flashing-template/*placeholder

(cd android-recovery-flashing-template ; tar -I 'zstd -19' -cvf ./$ZSTD_NAME . ; split -b 1500M ./$ZSTD_NAME ./$ZSTD_NAME.part --verbose ; mv ./${ZSTD_NAME}.part* ../out/ ; ls -lha ../out ; )

echo "current directory $(pwd)"
ls -lha
ls -lha ..
ls -lha ../out

echo "done."
