#!/bin/bash

file_to_monitor=${CAMDISPLAY_ROOT}/current.txt

while inotifywait -e close_write "$file_to_monitor"; do
  systemctl restart camdisplay.service
done
