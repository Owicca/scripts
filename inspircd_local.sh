#!/bin/bash

sudo docker run \
  -ti -d \
  --name inspircd_local \
  -p 6667:6667 \
  -p 6697:6697 \
  -p 7000:7000 \
  -p 7001:7001 \
  -v "$HOME/.config/.inspircd_config/":/inspircd/conf \
  inspircd/inspircd-docker
