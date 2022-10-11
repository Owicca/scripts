#!/bin/bash

dest="$1"

detox -r -s utf_8 ${dest}
detox -r -s lower ${dest}
