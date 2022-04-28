# hls-proxy-docker linux-arm64 
# Based on alpine:3.15.4 image
Docker to setup HLS Proxy

This is a very simple docker, it doesn't do anything more than download HLS Proxy and run it.

## Installation

First `git clone` this repository, `cd` to the repo directory and run
```bash
docker-compose up --build -d
```
P.S. Прокинута папка с хоста /opt/hls-proxy в контейнер, 
т.е. все настройки hls-proxy на хостовой машине.
Если хотите хранить всё в контейнере и настроить с нуля,
то в файле `docker-compose.yml` 
закоментируйте `#  - /opt/hls-proxy/:/opt/hlsp/` \
и раскоментируйте `- ./data:/opt/hlsp/`

The proxy will be available on http://localhost:8080 or http://YOUR_WEB_SERVER:8080

Configure Settings On The WEB UI

More information at https://www.hls-proxy.com
