#!/bin/bash

export LANG=en_US.UTF-8
old_dir=$PWD;

## function that provides tree output
tree() {
    for dir in *
    do
        cnt_dir=0
        for subdir in *
        do
            subdirs[$cnt_dir]=$subdir 
            cnt_dir=$[$cnt_dir+1]  
        done
        cnt_dir=$cnt_dir-1 
        if [ -d "$dir" ]
        then
            lvl=0
            while [ $lvl != $depth ]
            do
                printf "\u2502\u00A0\u00A0\u0020"
                lvl=$[$lvl+1]
            done
            if [ $dir = ${subdirs[cnt_dir]} ]
            then
                printf "\u2514\u2500\u2500\u0020$dir" ## checking if this dir is the last
                printf "\n"
                is_last=1
            else
                printf "\u251c\u2500\u2500\u0020$dir"
                printf "\n"
                is_last=0
            fi
            if cd "$dir"
            then
                depth=$[$depth+1]
                tree "$1"
                dcount=$[$dcount+1]
            fi
            
         else
             if [ $is_last = 0 ]
             then
                 lvl=0
                 while [ $lvl != $depth ]
                 do
                    printf "\u2502\u00A0\u00A0\u0020"
                    lvl=$[$lvl+1]  
                 done
             else
                 lvl=1
                 while [ $lvl -lt $depth ]
                 do
                    printf "\u2502\u00A0\u00A0\u0020"
                    lvl=$[$lvl+1]  
                 done
                 printf "\u0020\u0020\u0020\u0020"
             fi
             if [ $dir = ${subdirs[cnt_dir]} ]
             then
                printf "\u2514\u2500\u2500\u0020$dir"
                printf "\n"
                is_last=0
             else
                printf "\u251c\u2500\u2500\u0020$dir"
                printf "\n"
             fi
             fcount=$[$fcount+1]
         fi
    done
    cd .. ## step back in directories
    if [ "$depth" ]
    then
        end=1
    fi
    depth=$[$depth-1]
}

## start of output
if [ $# = 0 ] ## print . if no arguments 
then
    printf ".\n"
else
    cd $1
    printf "$*\n" ## print start dir
fi
end=0
depth=0
dcount=0
lvl=0
fcount=0
is_last=0

while [ "$end" != 1 ]
do
    tree "$1";
    cd $old_dir;
done
printf "\n"
if [ $dcount = 1 ]
then
    printf "$dcount directory, "
else
    printf "$dcount directories, "
fi
if [ $fcount = 1 ]
then
    printf "$fcount file\n"
else
    printf "$fcount files\n"
fi
