#! /bin/bash

# Version:     2
#
# Author:      bonedaddy <postables@rtradetechnologies.com>
#
# Description: System76 power management utility for optimal battery life.
#              Enables power management on gpu or gpu-less laptops.
#              All non performance-* commands default to intel graphics

case "$1" in

    performance-gpu)
        sudo system76-power profile performance
        sudo system76-power graphics nvidia
        sudo tlp ac
        ;;
    performance-hybrid)
        sudo system76-power profile performance
        sudo system76-power graphics hybrid
        sudo tlp ac
        ;;
    performance-intel)
        sudo system76-power profile performance
        sudo system76-power graphics intel
        sudo tlp ac
        ;;
    performance)
        sudo system76-power profile performance
        sudo tlp ac
        ;;
    battery)
        sudo system76-power profile battery
        sudo system76-power graphics intel
        sudo tlp bat
        ;;
    balanced)
        sudo system76-power profile balanced
        sudo system76-power graphcis intel
        sudo tlp ac
        ;;
    balanced-bat)
        sudo system76-power profile balanced
        sudo system76-power graphics intel
        sudo tlp bat
        ;;
    *)
        echo "improper invocation"
        echo "./power_management.sh <profile>"
        echo "profiles: performance, battery, balanced, balanced-bat"
        echo "performance-gpu: same as performance but enables nvidia gpu"
        echo "performance-hybrid: same as performance but enables hybrid graphics"
        echo "performance-intel: same as performance but enables intel graphics"
        echo "performance: runs system76-power in performance mode, and tlp in ac mode"
        echo "battery: runs sytem76-power in battery mode, and tlp in bat mode"
        echo "balanced: runs system76-power in balanced mode, and tlp in ac mode"
        echo "balanced-bat: runs system76-power in balanced mode, and tlp in bat mode"
        exit 1
        ;;
esac
