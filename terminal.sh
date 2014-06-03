#!/bin/bash

#global_folder=$HOME/.gconf/apps/gnome-terminal/global
#profile_folder=$HOME/.gconf/apps/gnome-terminal/profiles

global_folder=global
profile_folder=profiles


# global configure
function WriteGlobalFile()
{
    echo "Write Global File"
}

function UpdateGlobalFile()
{
    echo "Update Global File"

}

# profile configure
function WriteOwnProfile()
{
    echo "Write Own Profile"
}

if [ -d "$global_folder" ]; then  # global 目录存在
    if [ -f "$global_folder/%gconf.xml" ]; then  # %gconf.xml 文件存在
        echo "global %gconf.xml found"
        UpdateGlobalFile
    else
        touch "$global_folder/%gconf.xml"
        echo "new global %gconf.xml"
        WriteGlobalFile
    fi
else # global 目录不存在
    echo "no found the global configure file"
    mkdir $global_folder
    touch $global_folder/%gconf.xml
    WriteGlobalFile
fi

if [ -d "$profile_folder" ]; then # profile 目录存在
    WriteOwnProfile 
else # profile 目录不存在
    mkdir $profile_folder
    WriteOwnProfile
fi

