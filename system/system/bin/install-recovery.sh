#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:37438798:b4c1a9be54424867f5dcdbf854715f69cdfea4cf; then
  applypatch --bonus /system/etc/recovery-resource.dat \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:22787402:dbca5f50723703206f706052d70c38ceab9d9076 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:37438798:b4c1a9be54424867f5dcdbf854715f69cdfea4cf && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
