FROM caddy:2.7.5-builder-alpine AS builder

RUN xcaddy build \
 --with github.com/caddy-dns/dnspod \
 --with github.com/porech/caddy-maxmind-geolocation

FROM caddy:2.7.5-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
