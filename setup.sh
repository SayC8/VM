#!/usr/bin/env bash
set -xe

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 /path/to/os.iso"
    exit 1
fi

qemu-img create -f qcow2 vdisk.qcow2 20G;

qemu-system-x86_64 \
    -m 2G \
    -smp 2 \
    -enable-kvm \
    -drive file=vdisk.qcow2,format=qcow2 \
    -cdrom $1 \
    -boot d \
    -device e1000,netdev=net0 \
    -netdev user,id=net0,hostfwd=tcp::5555-:22
