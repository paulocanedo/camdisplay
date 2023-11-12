#!/bin/bash

. /etc/camdisplay

xset s noblank
xset s off
xset -dpms

idFromFile=`head -n 1 ${CAMDISPLAY_ROOT}/current.txt`

id="${idFromFile:=1}"
cameras=${CAMDISPLAY_ROOT}/list.txt

total=`wc -l $cameras | awk '{print $1}'`

cameraUrl=`head -n $id $cameras | tail -n 1`
#nvgstplayer-1.0 --srtsp "location=$cameraUrl" --svs="nvoverlaysink" --bg --uri "$cameraUrl"
gst-launch-1.0 rtspsrc location="\"$cameraUrl\"" latency=1000 ! decodebin ! nvoverlaysink
#ffplay -rtsp_transport tcp -timeout 3000000 -autoexit -alwaysontop -framedrop -fs -an -loglevel error "$cameraUrl"
