#!/bin/bash

sudo docker run -ti --rm -v "`pwd`:/data" -u 1000:1000 pandoc/latex:latest $1
