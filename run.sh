#!/bin/bash

if [ ! -d "$1" ]; then
	echo "Directory parameter omitted! Mounting current working directory as volume..."
	directory="`pwd`"
else
	echo "Mounting directory $1 as volume..."
	directory="$1"
fi
docker run -d --name="graphlab" -v="${directory}/notebooks:/notebooks" -p 127.0.0.1:8888:8888 graphlab
