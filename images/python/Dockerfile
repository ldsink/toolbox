ARG VERSION=3.13
FROM python:${VERSION}-alpine

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    PIP_NO_CACHE_DIR=true \
    PIP_INDEX_URL=https://mirrors.tencent.com/pypi/simple

RUN pip install \
    numpy==2.3.2 \
    pandas==2.3.2 \
    scipy==1.16.1
