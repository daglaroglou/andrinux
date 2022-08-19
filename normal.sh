#/bin/sh

ram=$(jq .ram config.json)
size=$(jq .size config.json)
cores=$(jq .cpu_cores config.json)
disk=$(jq -r .disk config.json)

qemu-system-x86_64 -enable-kvm -vga std \
                   -m $ram -smp $cores -cpu host \
                   -device ES1370 \
                   -net nic -net user \
                   -cdrom Android.iso \
                   -hda $disk \
                   -monitor stdio \
                   -boot c