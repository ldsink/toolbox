ARG VERSION
FROM caddy:${VERSION}-builder-alpine AS builder

RUN xcaddy build \
 --with github.com/caddy-dns/dnspod \
 --with github.com/porech/caddy-maxmind-geolocation

FROM caddy:${VERSION}-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
