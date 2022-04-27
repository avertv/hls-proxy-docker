FROM alpine:latest
EXPOSE 8085

RUN apk update
RUN apk add wget
RUN apk add unzip
RUN mkdir -p /opt/hlsp
VOLUME [ "/opt/hlsp" ]
COPY index.sh .
ENTRYPOINT [ "./index.sh" ]




