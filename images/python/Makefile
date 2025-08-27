export VERSION=3.13

build:
	docker build --build-arg="VERSION=${VERSION}" --tag ldsink/python:${VERSION} .
	docker push ldsink/python:${VERSION}