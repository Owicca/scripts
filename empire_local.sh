#!/bin/bash

sudo docker run -ti --rm \
  -p 45001:45001 \
  -p 45002:45002 \
  -v "$(pwd)/data:/empire/data/" \
  bcsecurity/empire:latest ./empire --restport 45001 --socketport 45002 --username admin --password admin
