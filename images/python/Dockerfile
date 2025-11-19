ARG VERSION=3.13
FROM python:${VERSION}-alpine

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    PIP_NO_CACHE_DIR=true \
    PIP_INDEX_URL=https://mirrors.tencent.com/pypi/simple

RUN sed -i 's|https://dl-cdn.alpinelinux.org/alpine|https://mirrors.cloud.tencent.com/alpine|g' /etc/apk/repositories \
    && apk add --no-cache \
    gcc \
    g++ \
    musl-dev \
    python3-dev \
    make \
    libffi-dev \
    openssl-dev \
    zlib-dev \
    libstdc++ \
    openblas-dev

RUN pip install \
    numpy==2.3.5 \
    pandas==2.3.3 \
    scipy==1.16.3 \
    scikit-learn==1.7.2
