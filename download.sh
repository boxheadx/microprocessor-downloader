#!/bin/bash

vid_n=8085

mkdir 8085 8086

for url in $( cat baseUrls ); do
	for vid in $( curl $url -H "Authorization: Basic $( printf 'pulchowk:ioec@mpus'|base64 )" | grep "class=\"name" | cut -f 2 -d ">"| sed -r 's/<a href="//' | tr -d "\"" ); do
		wget "$url$vid" --header="Authorization: Basic $( printf 'pulchowk:ioec@mpus'|base64 )" -P "$vid_n/"
	done
	vid_n=$(( vid_n+1 ))
done



