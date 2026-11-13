ARG VERSION=3.13
FROM python:${VERSION}-slim-trixie

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    PIP_NO_CACHE_DIR=true

RUN python -m pip install --only-binary=:all: \
    numpy==2.5.4 \
    pandas==3.1.1 \
    scipy==1.18.1 \
    scikit-learn==1.9.1
