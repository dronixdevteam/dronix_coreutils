#!/bin/bash
#===============================================================================
#
#          FILE:  dronix_tool.sh
# 
#         USAGE:  . dronix_tool.sh 
# 
#   DESCRIPTION:  DroniX Lib Tool
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Stefano Viola (), stefanoviola85@gmail.com
#       COMPANY:  DroniX Dev Team
#       VERSION:  0.1.0
#       CREATED:  28/09/2011 21:22:40 CEST
#      REVISION:  ---
#===============================================================================


#-------------------------------------------------------------------------------
#   INCLUDE Library Configuration Manager
#-------------------------------------------------------------------------------
. /system/lib/dronix/dronix_lib_CM.sh

function cli ()
{
       echo " "

}    # ----------  end of function cli  ----------


#===  FUNCTION  ================================================================
#          NAME:  theme_switcher
#   DESCRIPTION:  Switch DroniX theme
#    PARAMETERS:  Name themes [dronix04 | ginger | sense | restore | custom]
#       RETURNS:  void
#===============================================================================
function theme ()
{
       echo "Theme Settings"
       case $1 in
        dronix04)
                echo "Selected theme DroniX 0.4"
                cd /system/media/themes/
                cp -r dronix04/ /cache/res
                cd /cache
                zip -mrv /system/framework/framework-res.apk res/
                set_value "THEME" "dronix04"
                ;;
          ginger)
                echo "Selected theme Gingerbread"
                cd /system/media/themes/
                cp -r ginger/ /cache/res
                cd /cache
                zip -mrv /system/framework/framework-res.apk res/
                set_value "THEME" "ginger"
                ;;
           sense)
                echo "Selected theme HTC-Sense"
                cd /system/media/themes/
                cp -r sense/ /cache/res
                cd /cache
                zip -mrv /system/framework/framework-res.apk res/
                set_value "THEME" "sense"
                ;;
         restore)
                echo "Restore default theme"
                cd /system/media/themes/
                cp -r original/ /cache/res
                cd /cache
                zip -mrv /system/framework/framework-res.apk res/
                set_value "THEME" "default"
                set_value "BATTERY" "default"
                ;;
	 battery1)
                echo "Selected Battery 1"
                cd /system/media/themes/
                cp -r battery1/ /cache/res
                cd /cache
                zip -mrv /system/framework/framework-res.apk res/
                frkrw
                set_value "BATTERY" "battery1"
                ;;
	 battery2)
                echo "Selected Battery 2"
                cd /system/media/themes/
                cp -r battery2/ /cache/res
                cd /cache
                zip -mrv /system/framework/framework-res.apk res/
                frkrw
                set_value "BATTERY" "battery2"
                ;;
          custom)
                cd /mnt/sdcard/dronix-themes/
                cp -r custom/ /cache/res
                cd /cache
                zip -mrv /system/framework/framework-res.apk res/
                set_value "THEME" "custom"
                ;;
               *)
                echo "error"
                ;;
       esac


}    # ----------  end of function theme  ----------



#===  FUNCTION  ================================================================
#          NAME:  change_icon
#   DESCRIPTION:  Change Icon Framework
#    PARAMETERS:  Name Icon Pack
#       RETURNS:  VOID
#===============================================================================
function change_icon ()
{        
        echo "Change Icon"
        case $1 in
                battery1)
                        echo "Selected Battery 1"
                        cd /system/media/themes/
                        cp -r battery1/ /cache/res
                        cd /cache
                        zip -mrv /system/framework/framework-res.apk res/
                        frkrw
                        ;;
                battery2)
                        echo "Selected Battery 2"
                        cd /system/media/themes/
                        cp -r battery2/ /cache/res
                        cd /cache
                        zip -mrv /system/framework/framework-res.apk res/
                        frkrw
                        ;;
                *)
                        echo "error"
                        ;;
        esac

}    # ----------  end of function change_icon  ----------


function update ()
{
        
        
}    # ----------  end of function update  ----------


function upgrade ()
{
echo ""
}    # ----------  end of function upgrade  ----------


