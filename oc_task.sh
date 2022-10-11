#!/bin/bash

task=""
branch="qa"
author=""
cmd="git log"

while getopts t:b:a: flag
do
  case "${flag}" in
    t) task=${OPTARG};;
    b) branch=${OPTARG};;
    a) author=${OPTARG};;
  esac
done


[ -n "$branch" ] && cmd="$cmd $branch"
cmd="$cmd --grep='.*_${task}.*'"
[ -n "$author" ] && cmd="$cmd --author='${author}'"

eval "$cmd"
