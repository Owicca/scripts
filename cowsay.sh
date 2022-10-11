#!/bin/bash

source err
source check_params

check_params_callback $# 1 err "No input text provided"

input="$1"
text="|$input|"
delimiter_count=$(echo $text | wc -m)
delimiter=$(printf "%${delimiter_count}s" | tr " " "-")
cow="     \ ^__^
      \ (oo)\_______
        (__)\       )\/\
            ||----w |
            ||     ||
            ||     ||"

#printf "%s\n%s\n%s" $header $text $cow
printf  "%s\n%s\n%s\n%s" $delimiter $text $delimiter $cow
