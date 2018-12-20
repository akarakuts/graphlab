#!/bin/bash

if [ ! -d "$1" ]; then
	echo "Directory parameter omitted! Mounting current working directory as volume..."
	directory="`pwd`"
else
	echo "Mounting directory $1 as volume..."
	directory="$1"
fi
docker run -d --name="graphlab" -p 8888:8888 --sysctl net.ipv6.conf.all.disable_ipv6=0 -v="${directory}/notebooks:/workplace/notebooks" -v="${directory}/data:/workplace/data" graphlab
