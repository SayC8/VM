#!/usr/bin/env bash
set -xe

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 gui|cli" >&2
    exit 1
fi

cmd=(
    qemu-system-x86_64 \
        -m 2G \
        -smp 2 \
        -enable-kvm \
        -drive file=vdisk.qcow2,format=qcow2 \
        -device e1000,netdev=net0 \
        -netdev user,id=net0,hostfwd=tcp::5555-:22 \
)

case "$1" in
    gui) ;;
    cli) cmd+=(--nographic) ;;
    *) "Usage: $0 gui|cli" >&2; exit 1 ;;
esac

"${cmd[@]}"
