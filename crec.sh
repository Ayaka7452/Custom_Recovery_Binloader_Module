#!/bin/sh
# Custom Recovery Utils
# Powered by Ayaka7452


defpath=`cat /data/binloader/configs/defpath`
modid=Custom_Rec
modpath=$defpath/mods/$modid
crecpath=$modpath/custom_recovery.img
bakpath=$modpath/stock_recovery.img
res_f1=$modpath/cmd.sh
res_f2=$modpath/boot_crec.sh
res_f3=$modpath/otg-backup
res_f4=$modpath/otg-restore
res_f5=$modpath/dd
res_lib=$modpath/lib/*

if [ ! -f $bakpath ]; then
 echo "backing up stock recovery ..."
 dd if=/dev/block/by-name/recovery of=$bakpath
 echo "saved stock image"
 echo "recall this utility to proceed"
 exit 0
fi

[ ! -f $crecpath ] && echo "err: no custom recovery image provided" && exit 0

flash_crec() {
 
 echo "flashing custom recovery image ..."
 dd if=$crecpath of=/dev/block/by-name/recovery
 echo "successfully flashed "

}

deploy_rescue() {

 echo "deploying rescue kit to cache partition ..."
 [ ! -d /cache/rescue ] && mkdir /cache/rescue
 cp -f $res_f1 /cache/rescue/
 cp -f $res_f2 /cache/rescue/
 cp -f $crecpath /cache/rescue/
 cp -f $res_f3 /cache/rescue
 cp -f $res_f4 /cache/rescue
 cp -f $res_f5 /cache/rescue
 mkdir -p /cache/rescue/lib
 cp -f $res_lib /cache/rescue/lib
 echo "rescue kit deployed"

}

set_rebootr() {

 setprop sys.powerctl reboot,recovery
 echo "rebooting to recovery ..."

}


version_info() {

 if [ -f $modpath/version.txt ]; then
  cat $modpath/version.txt
 else
  echo "no version info provided"
  exit 0
 fi

}


help_docs() {
 
 echo "CREC - custom recovery management utils"
 echo "Usage: crec [Options]"
 echo "Options:"
 echo "flash - flash custom rec image to slot"
 echo "reboot-rec - reboot to recovery"
 echo "instrk - deploy rescue kit to cache"
 echo "version - display version of custom rec"
 echo "for further info, type 'notice'"
 echo "Powered by Ayaka7452"
 
}


notice_docs() {

 cat $modpath/notice.txt
 echo ""

}


case $1 in
flash)
 flash_crec
 ;;
reboot-rec)
 set_rebootr
 ;;
instrk)
 deploy_rescue
 ;;
ver)
 version_info
 ;;
notice)
 notice_docs
 ;;
help)
 help_docs
 ;;
*)
 echo "err: invalid option"
 echo "type 'help' for more information"
 exit 0
 ;;
esac

exit 0

