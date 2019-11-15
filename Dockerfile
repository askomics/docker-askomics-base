FROM alpine:3.9

MAINTAINER "Xavier Garnier <xavier.garnier@irisa.fr>"

COPY ./requirements.txt /requirements.txt

RUN apk add --no-cache \
    gcc g++ libstdc++ make \
    zlib-dev libzip-dev bzip2-dev xz-dev \
    python3 python3-dev \
    py3-numpy \
    nodejs nodejs-npm \
    git bash && \
    mkdir /askomics && \
    cd /askomics && \
    python3 -m venv venv && source /askomics/venv/bin/activate && \
    mv /requirements.txt /askomics/requirements.txt && \
    pip install -r requirements.txt && \
    rm /askomics/requirements.txt
