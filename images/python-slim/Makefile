export VERSION=3.14

build:
	docker build --build-arg="VERSION=${VERSION}" --tag ldsink/python:${VERSION}-slim .
	docker push ldsink/python:${VERSION}-slim
