#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:37434702:f08d07e0216a2a380fcee50955d1344385e63925; then
  applypatch --bonus /system/etc/recovery-resource.dat \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:22783306:c6c1e64d31e5a812c183850fe748cabd6711e931 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:37434702:f08d07e0216a2a380fcee50955d1344385e63925 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
