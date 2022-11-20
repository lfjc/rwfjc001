FROM alpine:edge

ENV AUUID=2b6bbb33-8364-4b90-a5b7-48cc10b717d9
    ParameterSSENCYPT=chacha20-ietf-poly1305
    StoreFiles=https://raw.githubusercontent.com/lfjc/rwfjc001/main/etc/StoreFiles

RUN apk update && \
    apk add --no-cache ca-certificates caddy tor wget && \
    wget https://raw.githubusercontent.com/lfjc/rwfjc001/main/etc/ray-linux-64.zip && \
    busybox unzip /ray-linux-64.zip && \
    #mv /ray-linux-64/* / && \
    chmod +x /ray && \
    #rm -rf /ray-linux-64 && \
    rm -rf /var/cache/apk/*

ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD /start.sh