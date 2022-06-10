#! /bin/sh
mkdir ./data
#/usr/bin/docker-compose up -d "$@"
/usr/bin/docker run -d -p 8080:8080 --restart unless-stopped -v ./data:/opt/hls-proxy --name TEST-HLS-PROXY -t -i hls-proxy "$@"
