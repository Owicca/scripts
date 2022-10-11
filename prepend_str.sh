#!/bin/bash


prefix="$1"
dir_path="$2"

for fl in $dir_path/*
do
  name=$(basename "${fl}")
  mv "${fl}" "${dir_path}/${prefix}_${name}"
done
