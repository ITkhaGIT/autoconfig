#!/bin/Bash
CheckFile() {
if [ ! -f "$1" ]; then
    sudo touch "$1"
    ShowSuccessful "File $1 created."
 fi
}

CheckFolder() {
if [ ! -d "$1" ]; then
    sudo mkdir -p "$1"
    
 fi
}
