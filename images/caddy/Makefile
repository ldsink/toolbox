export VERSION=2.10.2

build:
	docker build --build-arg="VERSION=${VERSION}" --tag ldsink/caddy:${VERSION} .
	docker push ldsink/caddy:${VERSION}