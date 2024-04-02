export VERSION=2.7.6

build:
	docker build --build-arg="VERSION=${VERSION}" --tag dockerhub.qingcloud.com/ldsink/caddy:${VERSION} .
	docker push dockerhub.qingcloud.com/ldsink/caddy:${VERSION}
