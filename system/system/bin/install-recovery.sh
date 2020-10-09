#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:37442894:081cae86b44bc27b44644ebb14ad6f5c61543fc2; then
  applypatch --bonus /system/etc/recovery-resource.dat \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:22791498:cf178e988f3a0ebbb14a61f8570ddb7d55a74cdc \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:37442894:081cae86b44bc27b44644ebb14ad6f5c61543fc2 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
