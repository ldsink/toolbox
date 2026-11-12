ARG VERSION=2.11.9
FROM caddy:${VERSION}-builder-alpine AS builder
ARG VERSION

RUN xcaddy build v${VERSION} \
 --with github.com/caddy-dns/tencentcloud \
 --with github.com/caddy-dns/namecheap \
 --with github.com/porech/caddy-maxmind-geolocation \
 --with github.com/caddyserver/forwardproxy \
 --with github.com/ldsink/caddy-tap

FROM caddy:${VERSION}-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
