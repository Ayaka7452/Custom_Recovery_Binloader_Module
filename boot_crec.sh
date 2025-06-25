#!/bin/sh
# temporary boots the custom recovery at next device boot

# default custom recovery path
twrpath=/cache/rescue/custom_recovery.img


[ ! -f $twrpath ] && exit 0


dd if=$twrpath of=/dev/block/by-name/recovery


setprop sys.powerctl reboot,recovery


exit 0
