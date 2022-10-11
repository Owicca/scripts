#!/bin/bash

input="$1"

grep -R -i --exclude-dir={.idea,cache,files,themes_repository,.git} $input . | less
