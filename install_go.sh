#!/bin/bash

go version

sudo rm -rf /opt/go
sudo tar -C /opt/ -xzf "$1"

go version
