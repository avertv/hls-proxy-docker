#!/bin/sh

echo '------ DOWNLOADING HLS PROXY -------'
wget https://www.hls-proxy.com/downloads/8.1.9/hls-proxy-8.1.9.linux-arm64.zip -O /var/tmp/hlsproxy.zip
echo '------ UNZIP HLS PROXY -------'
mkdir -p /var/tmp/hlsp/
unzip -o /var/tmp/hlsproxy.zip -d /var/tmp/hlsp/
cp /var/tmp/hlsp/* /opt/hlsp
echo '------ copy your groups.json -------'
wget https://raw.githubusercontent.com/avertv/hls-proxy-docker/master/data/groups.sample.json -O /opt/hlsp/groups.json
echo '------ CLEAN UP TEMP -------'
rm -rf /var/tmp/hlsp/
rm -rf /var/tmp/hlsproxy.zip
rm -rf /var/lib/apt/lists/*
echo '------ CHMOD HLS PROXY -------'
chmod +x /opt/hlsp/hls-proxy
echo '------ ALLOW HLS PROXY ON EVERY INTERFACE -------'
/opt/hlsp/hls-proxy -address 127.0.0.1 -port 8085 -save -quit
echo '------ SERVE HLS PROXY -------'
/opt/hlsp/hls-proxy
