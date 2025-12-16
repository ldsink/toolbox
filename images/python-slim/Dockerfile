ARG VERSION=3.14
# Based on Debian 13 (Trixie)
FROM python:${VERSION}-slim

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    PIP_NO_CACHE_DIR=true \
    PIP_INDEX_URL=https://mirrors.tencent.com/pypi/simple

ARG ARCHITECTURE=amd64

# 安装基础依赖和软件
RUN sed -i -E "s/deb\.debian\.org/mirrors\.tencent\.com/g" /etc/apt/sources.list.d/debian.sources \
    && apt clean && apt update \
    && apt install --no-install-recommends -y dumb-init \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install --no-cache-dir uv
