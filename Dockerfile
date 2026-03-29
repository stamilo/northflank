FROM alpine:3.19

RUN apk add --no-cache curl unzip

# 安装 Xray
RUN curl -L -o xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    && unzip xray.zip \
    && mv xray /usr/local/bin/ \
    && rm -rf xray.zip

# 安装 cloudflared
RUN curl -L -o cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 \
    && chmod +x cloudflared \
    && mv cloudflared /usr/local/bin/

COPY config.json /etc/xray/config.json
COPY start.sh /start.sh

RUN chmod +x /start.sh

CMD ["/start.sh"]