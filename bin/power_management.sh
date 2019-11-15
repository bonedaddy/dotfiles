#! /bin/bash

# Used to manage power utilization on system76 laptops

case "$1" in 
    
    performance)
        sudo system76-power profile performance
        sudo tlp ac
        ;;
    battery)
        sudo system76-power profile battery
        sudo tlp bat
        ;;
    balanced)
        sudo system76-power profile balanced
        sudo tlp ac
        ;;
    balanced-bat)
        sudo system76-power profile balanced
        sudo tlp bat
        ;;
    *)
        echo "improper invocation"
        echo "./power_management.sh <profile>"
        echo "profiles: performance, battery, balanced, balanced-bat"
        echo "performance: runs system76-power in performance mode, and tlp in ac mode"
        echo "battery: runs sytem76-power in battery mode, and tlp in bat mode"
        echo "balanced: runs system76-power in balanced mode, and tlp in ac mode"
        echo "balanced-bat: runs system76-power in balanced mode, and tlp in bat mode"
        exit 1
        ;;
esac
