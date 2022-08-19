#/bin/sh

ram=$(jq .ram config.json)
size=$(jq .size config.json)
cores=$(jq .cpu_cores config.json)

qemu-system-x86_64 -enable-kvm -vga std \
                   -m $ram -smp $cores -cpu host \
                   -device ES1370 \
                   -net nic -net user \
                   -hda Android.iso \
                   -monitor stdio
                   -boot d