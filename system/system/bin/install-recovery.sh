#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:37442894:3a381e36c5469317d76632641f41a05e30b454a1; then
  applypatch --bonus /system/etc/recovery-resource.dat \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:22791498:c45ad657e86b61c7904b4b157cd1ace411ac2cf8 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:37442894:3a381e36c5469317d76632641f41a05e30b454a1 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
