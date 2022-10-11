#!/bin/bash

name="$1"
url="https://www.twitch.tv/$name"
output="$2"

if [ $# -ne 2 ];then
  echo "[USAGE] $0 <url.com/to/stream> </output/location/>"
  exit 1
fi

if [ ! -d $output ];then
  echo "Location $output does not exist!"
  exit 1
fi


cmd="streamlink $url 720p60,720p --twitch-disable-ads"

while [ 1 -eq 1 ];do
  dt="$(date +'%d_%m_%Y')"
  $cmd -o "$output/${name}_${dt}_${RANDOM}.ts"
  sleep 60
done;
