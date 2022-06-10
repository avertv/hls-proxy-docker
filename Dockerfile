FROM alpine:latest 
EXPOSE 8080
LABEL maintainer="AverTV"

RUN apk update && apk add --no-cache mc && apk add --no-cache ffmpeg && \
	apk add --no-cache wget && apk add --no-cache unzip && \
	apk add --no-cache nano && apk add --no-cache ca-certificates && \
	apk add --no-cache procps
	
VOLUME [ "/opt/hls-proxy" ]
COPY index.sh .
CMD sleep 10
ENTRYPOINT [ "./index.sh" ]
