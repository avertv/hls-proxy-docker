#!/bin/sh

echo '------ DOWNLOADING HLS PROXY -------'
wget https://www.hls-proxy.com/downloads/8.2.1-beta.1/hls-proxy-8.2.1-beta.1.linux-x64.zip -O /var/tmp/hls-proxyroxy.zip
echo '------ UNZIP HLS PROXY -------'
mkdir -p /var/tmp/hls-proxy/
unzip -o /var/tmp/hls-proxyroxy.zip -d /var/tmp/hls-proxy/
cp /var/tmp/hls-proxy/* /opt/hls-proxy
echo '------ copy your groups.json -------'
wget https://raw.githubusercontent.com/avertv/hls-proxy-docker/master/data/groups.json -O /opt/hls-proxy/groups.json
echo '------ CLEAN UP TEMP -------'
rm -rf /var/tmp/hls-proxy/
rm -rf /var/tmp/hls-proxyroxy.zip
rm -rf /var/lib/apt/lists/*
echo '------ CHMOD HLS PROXY -------'
chmod +x /opt/hls-proxy/hls-proxy
echo '------ ALLOW HLS PROXY ON EVERY INTERFACE -------'
/opt/hls-proxy/hls-proxy -address 0.0.0.0 -port 8080 -save -quit
echo '------ START HLS PROXY -------'
/opt/hls-proxy/hls-proxy
