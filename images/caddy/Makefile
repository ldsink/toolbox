export VERSION=2.11.2

build:
	docker build --build-arg="VERSION=${VERSION}" --tag ldsink/caddy:${VERSION} .
	docker push ldsink/caddy:${VERSION}