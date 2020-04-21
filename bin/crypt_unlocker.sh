 #! /bin/bash

# wrapper script to handle open+mount, and closing of luks encrypted drives

case "$1" in

    open)
        echo "enter encrypt partition, ie /dev/sdc1"
        read -r PARTITION
        echo "enter name for partition"
        read -r NAME
        echo "[INFO] opening drive"
        sudo cryptsetup luksOpen "$PARTITION" "$NAME"
        if [[ "$?" -ne 0 ]]; then
            echo "[ERROR] failed to open luks encrypted drive"
            exit 1
        fi
        echo "enter path to mount drive to"
        read -r MOUNT_POINT
        echo "[INFO] mounting drive"
        sudo mount "/dev/mapper/$NAME" "$MOUNT_POINT"
        if [[ "$?" -ne 0 ]]; then
            echo "[ERROR] failed to mount drive"
            exit 1
        fi
        echo "[INFO] successfully mounted drive"
        ;;
    close)
        echo "enter encrpted drive to unmount, ie /dev/mapper/foo"
        read -r MOUNT_POINT
        echo "[INFO] unmounting drive"
        sudo umount "$MOUNT_POINT"
        if [[ "$?" -ne 0 ]]; then
            echo "[ERROR] failed to unmount drive"
            exit 1
        fi
        echo "[INFO] closing luks drive"
        sudo cryptsetup luksClose "$MOUNT_POINT"
        if [[ "$?" -ne 0 ]]; then
            echo "[ERROR] failed to close luks drive"
            exit 1
        fi
        echo "[INFO] successfully unmounted and closed luks drive"
        ;;
    *)
        echo "invalid invocation"
        echo "./mounter.sh [open | close]"

esac

