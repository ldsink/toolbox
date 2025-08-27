ARG VERSION=2.10.2
FROM caddy:${VERSION}-builder-alpine AS builder

RUN xcaddy build \
 --with github.com/caddy-dns/tencentcloud \
 --with github.com/porech/caddy-maxmind-geolocation \
 --with github.com/caddyserver/forwardproxy

FROM caddy:${VERSION}-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
