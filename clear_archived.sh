#!/bin/bash

for f in ./*.tar.gz;do
	rm ${f%.tar.gz}
done
