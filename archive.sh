#!/bin/bash

for f in ./*.sql;do
	tar czvf "${f}.tar.gz" $f
	rm $f
done
