FROM alpine:edge

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