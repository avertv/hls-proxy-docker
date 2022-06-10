#! /bin/sh
mkdir ./data
#/usr/bin/docker-compose up -d "$@"
dirlocal=$pwd
/usr/bin/docker run -d -p 8080:8080 --restart unless-stopped -v "$dirlocal"/data:/opt/hls-proxy --name TEST-HLS-PROXY -t -i hls-proxy "$@"
