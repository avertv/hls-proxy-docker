FROM alpine:latest
EXPOSE 8085

RUN apk update
RUN apk add --no-cache ffmpeg
RUN apk add --no-cache wget
RUN apk add --no-cache unzip
RUN mkdir -p /opt/hlsp
VOLUME [ "/opt/hlsp" ]
COPY index.sh .
ENTRYPOINT [ "./index.sh" ]




