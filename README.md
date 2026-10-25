## Quickstart

Requires:
- QEMU
- ISO of your preferred OS

```console
./setup.sh <path/to/your/iso>

./start <gui|cli>
```

## Config

If you require more ram or compute in the vm then modify these lines in each script:
```console
    -m 2G \
    -smp 2 \
```

If you want a specific TCP port for SSH login then modify this line in each script:
```console
    -netdev user,id=net0,hostfwd=tcp::5555-:22
```
