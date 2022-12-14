#!/bin/bash
LOG_FOLDER=/var/log/autoconfig
LOG_FIlE="/autoconfig-$(date +%d_%m_%Y).log"

MAX_LOG=2

NORMAL_COLOR='\033[37m'
ERROR_COLOR='\033[0;31m'
INFO_COLOR='\033[0;33m'
SUCCE_COLOR='\033[0;32m'


LOG_PATH="$LOG_FOLDER$LOG_FIlE"

CheckPath()
{
 if [ ! -d $LOG_FOLDER ]; then
    sudo mkdir -p $LOG_FOLDER
 fi
 if [ ! -f "$LOG_PATH" ]; then
    sudo touch "$LOG_PATH"
    sudo chmod a+w "$LOG_PATH"
 fi


###Remove old log

OLD_LOG=$(ls -t -r $LOG_FOLDER | head -n -$MAX_LOG)
	for OLD_FILE in $OLD_LOG
	do
		sudo rm -rf $LOG_FOLDER/$OLD_FILE > /dev/null 2>&1
	        if [ $? -eq 0 ]
        	then
			ShowSuccessful "Old logs have been removed"
		        else
	                ShowError "Old logs haven't been removed"
        	fi

  	done



}


ShowError() {
   CheckPath
   echo -e "[ ${ERROR_COLOR}Error${NORMAL_COLOR} ] \t - $(date +%T) - $1"
   echo -e "[ Error ] - $(date +%T) - $1" >> $LOG_PATH
}
ShowSuccessful(){
   CheckPath
   echo -e "[ ${SUCCE_COLOR}Ok${NORMAL_COLOR} ] \t\t - $(date +%T) - $1"
   echo -e "[ Ok ] - $(date +%T) - $1" >> $LOG_PATH
}
ShowInfo() {
   CheckPath
   echo -e "[ ${INFO_COLOR}Info${NORMAL_COLOR} ] \t - $(date +%T) - $1"
   echo -e "[ Info ] - $(date +%T) - $1" >> $LOG_PATH

}
