#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:37446990:744d23ec327a7147040f7059774d7ec0e73d2cfc; then
  applypatch --bonus /system/etc/recovery-resource.dat \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:22791498:b6375a3c6d992049c9dfac503e4353fb95e8cc9c \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:37446990:744d23ec327a7147040f7059774d7ec0e73d2cfc && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
