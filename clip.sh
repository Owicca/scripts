#!/bin/bash

input="$1"
part=1
total_length=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 -sexagesimal $input)
total_length_seconds=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 $input)
length=15

mkdir ./data


function clip() {
  length=$1
  seek_mult=$2
  input="$3"
  output="$4"
  seek=$(($seek_mult * 10))
  echo $seek

  ffmpeg \
    -ss $seek \
    -t $length \
    -i $input \
    -vf "fps=25,scale=720:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
    -loop 0 \
    "$output.gif" &>/dev/null
}

length_check=$(($length * $part))
while [ $length_check -le ${total_length_seconds/.*} ]
do
  ((part++))
  length_check=$(($length * $part))
  #echo $length_check $total_length_seconds $part
  clip $length $part $input "./data/${part}_$RANDOM"
done
