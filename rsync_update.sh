#!/bin/bash

#-a \# archive
#-u \# only copy new or updated(newer mtime)
#-v \# verbose
#-h \# human readable numbers
#--progress \# progress of the transferr

rsync \
  -a \
  -u \
  -v \
  -h \
  --progress \
  "${1}" "${2}"
