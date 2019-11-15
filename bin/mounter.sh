#! /bin/bash

# mounter.sh
# author: postables
# script to handle various disk management tasks:
#       * mount/unmount luks encrypted drives
#       * mount/unmount sshfs directories
# wrapper script to handle open+mount, and closing of luks encrypted drives

function sshfs_exists {
    if [[  $(which sshfs) == "" ]]; then
        echo "sshfs not installed"
        exit 1
    fi
}

function help {
    printf "
help menu
\n
\tmount-sshfs)
\t
\t        * mount a remote directory via sshfs
\t        * requires sshfs be installed
\n
\tunmount-sshfs)
\t
\t        * unmount FUSE filesystems
\t        * requires sshfs be installed
\n
\tfsck-luks)
\t        * decrypt luks encrypted drive and run fsck
\n
\tmount-luks)
\t        * decrypt, and mount a luks encrypted drive
\n
\tunmount-luks)
\t        * unmount a luks encrypted rive (this decrypts it) 
\n
" | less
}

case "$1" in

    mount-sshfs)
        sshfs_exists
        echo "enter remote username"
        read -r USER
        echo "enter remote host identifier (ip, dns, etc...)"
        read -r HOST
        echo "enter remote directory to mount from"
        read -r REMOTE_DIR
        echo "enter local path to mount to"
        read -r LOCAL_DIR
        echo "$USER@$HOST:$REMOTE_DIR $LOCAL_DIR"
        sshfs $USER\@$HOST\:$REMOTE_DIR $LOCAL_DIR
        ;;
    unmount-sshfs)
        sshfs_exists
        echo "enter sshfs mount point"
        read -r MOUNT_POINT
        fusermount -u "$MOUNT_POINT"
        ;;
    fsck-luks)
        echo "enter encrypt partition, ie /dev/sdc1"
        read -r PARTITION
        echo "enter name for partition"
        read -r NAME
        echo "[INFO] opening drive"
        sudo cryptsetup luksOpen "$PARTITION" "$NAME"
        sudo fsck "/dev/mapper/$NAME"
        ;;
    mount-luks)
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
    unmount-luks)
        echo "enter encrpted drive to unmount, ie /dev/mapper/ipfs-data"
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
        help
        ;;

esac
