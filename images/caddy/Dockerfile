ARG VERSION=2.11.9
# shortcut: official 2.11.9 images are unavailable; use matching bases once published.
FROM caddy:2.11.8-builder-alpine AS builder
ARG VERSION

RUN xcaddy build v${VERSION} \
 --with github.com/caddy-dns/tencentcloud \
 --with github.com/caddy-dns/namecheap \
 --with github.com/porech/caddy-maxmind-geolocation \
 --with github.com/caddyserver/forwardproxy

FROM caddy:2.11.8-alpine
ARG VERSION
ENV CADDY_VERSION=v${VERSION}
LABEL org.opencontainers.image.version=v${VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
