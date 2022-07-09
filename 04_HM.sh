#!/bin/bash
qemu-system-ppc64 -cpu POWER8 \
-machine pseries -m 4096 -serial stdio \
-drive file=hdisk0.qcow2,if=none,id=drive-virtio-disk0 \
-device virtio-scsi-pci,id=scsi \
-device scsi-hd,drive=drive-virtio-disk0 \
-cdrom aix_7200-04-02-2027_1of2_072020.iso \
-prom-env "boot-command=boot disk:" \
-prom-env "input-device=/vdevice/vty@71000000" \
-prom-env "output-device=/vdevice/vty@71000000"
