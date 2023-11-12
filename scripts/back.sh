#!/bin/bash
source /etc/camdisplay

cameras=${CAMDISPLAY_ROOT}/list.txt
cur_camera=${CAMDISPLAY_ROOT}/current.txt

curId=`cat $cur_camera`
total=`wc -l $cameras | awk '{print $1}'`

nextId="$(($curId - 1))"

if [ $nextId -le 0 ]
  then
    nextId=$total
fi

echo $nextId > $cur_camera 
