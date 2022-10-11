#!/bin/bash

sudo docker run \
  -ti -d --rm \
  --name="mermaid_l" \
  -p 8080:80 \
  supinf/mermaid-editor
