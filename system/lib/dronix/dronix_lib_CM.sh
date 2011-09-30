#!/bin/bash
#===============================================================================
#
#          FILE:  dronix_lib_CM.sh
# 
#         USAGE:  ./dronix_lib_CM.sh 
# 
#   DESCRIPTION:  Configuration Manager Library
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Stefano Viola (estebanSannin), stefanoviola85@gmail.com
#       COMPANY:  DroniX Dev Team
#       VERSION:  0.1.0
#       CREATED:  30/09/2011 19:07:18 CEST
#      REVISION:  ---
#===============================================================================


#-------------------------------------------------------------------------------
#   FUNCTION:
#
#       clean_conf
#       add_record
#       set_value
#       get_value
#       delete_records
#
#
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
#   PATH configuration file
#-------------------------------------------------------------------------------
CONFIGURATION_FILE=/system/etc/dronix.prop


#===  FUNCTION  ================================================================
#          NAME:  clean_conf
#   DESCRIPTION:  Clean configuration
#    PARAMETERS:  
#       RETURNS:  
#===============================================================================
function clean_conf ()
{
        mountrw
        echo "" > $CONFIGURATION_FILE
        mountro
}    # ----------  end of function clean_conf  ----------


#===  FUNCTION  ================================================================
#          NAME:  add_record
#   DESCRIPTION:  Add new record in dronix.prop
#    PARAMETERS:  $1=KEY $2=VALUE
#       RETURNS:  VOID | NULL
#===============================================================================
function add_record ()
{
        mountrw
        KEY=`cat $CONFIGURATION_FILE | grep $1 | cut -d= -f1`
        if [ -z $KEY ]; then
                echo $1=$2 >> $CONFIGURATION_FILE
        else
                echo NULL
        fi
        mountro
}    # ----------  end of function add_record  ----------


#===  FUNCTION  ================================================================
#          NAME:  set_value
#   DESCRIPTION:  Modify the value in the dronix.prop
#    PARAMETERS:  $1=exist KEY $2=new VALUE 
#       RETURNS:  VOID | NULL
#===============================================================================
function set_value ()
{
        mountrw
        KEY=`cat $CONFIGURATION_FILE | grep $1 | cut -d= -f1`
        
        if [ -z $KEY ]; then
                echo NULL
        else
                VALUE=`cat $CONFIGURATION_FILE | grep $1 | cut -d= -f2`
                cat $CONFIGURATION_FILE | grep $1 | sed -i "s/$KEY=$VALUE/$KEY=$2/g" $CONFIGURATION_FILE
        fi
        mountro
}    # ----------  end of function set_value  ----------

#===  FUNCTION  ================================================================
#          NAME:  get_value
#   DESCRIPTION:  Get the KEY value
#    PARAMETERS:  $1=KEY
#       RETURNS:  VALUE | NULL
#===============================================================================
function get_value ()
{
        mountrw
        VALUE=`cat $CONFIGURATION_FILE | grep $1 | cut -d= -f2`
        
        if [ -z $VALUE ]; then
                echo "NULL"
        else
                echo $VALUE
        fi
        mountro
}    # ----------  end of function get_value  ----------


#===  FUNCTION  ================================================================
#          NAME:  delete_records
#   DESCRIPTION:  Delete the record in dronix.prop
#    PARAMETERS:  $1=KEY
#       RETURNS:  VOID | NULL
#===============================================================================
function delete_record ()
{
        mountrw
        RECORD=`cat $CONFIGURATION_FILE | grep $1`
        
            if [ -z $RECORD ] ; then
                echo NULL
            else
                cat $CONFIGURATION_FILE | grep $1 | sed -i "s/$RECORD//g" $CONFIGURATION_FILE
                sed -i '/^$/d' $CONFIGURATION_FILE
            fi
        mountro
}    # ----------  end of function delete_record  ----------





set_value $1 $2

