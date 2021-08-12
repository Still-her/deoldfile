#!/bin/bash

#保留文件数 sed -i 's/\r$//' my.sh (my.sh是脚本名字)
ReservedNum=2
FileDir=/mnt/hgfs/Share/te
date=$(date "+%Y%m%d-%H%M%S")

FileNum=$(ls -l $FileDir|grep ^- |wc -l)

while(( $FileNum > $ReservedNum))
do
    OldFile=$(ls -rt $FileDir| head -1)
    echo  $date "Delete File:"$OldFile
    rm -rf $FileDir/$OldFile
    let "FileNum--"
done 
