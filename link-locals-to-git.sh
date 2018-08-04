#!/usr/bin/env bash

set -o errexit

cd ./home
find . -type f -print0 | while IFS= read -r -d '' line ; do
	echo "ln -f ~/${line} ${line}"
	ln -f ~/"${line}" "${line}"
done
