FROM alpine:3.14

MAINTAINER "Xavier Garnier <xavier.garnier@irisa.fr>"

COPY ./requirements.txt /requirements.txt
COPY ./Pipfile /Pipfile
COPY ./Pipfile.lock /Pipfile.lock

RUN apk add --no-cache --update \
    gcc g++ libstdc++ make \
    zlib-dev libzip-dev bzip2-dev xz-dev \
    cython python3 python3-dev \
    build-base openldap-dev python2-dev \
    py3-numpy \
    nodejs-current npm \
    git bash && \
    mkdir /askomics && \
    cd /askomics && \
    python3 -m venv venv && source /askomics/venv/bin/activate && \
    pip install --upgrade pip && \
    mv /requirements.txt /askomics/requirements.txt && \
    mv /Pipfile /askomics/Pipfile && \
    mv /Pipfile.lock /askomics/Pipfile.lock && \
    pip install -r requirements.txt && \
    pipenv install && \
    rm /askomics/requirements.txt /askomics/Pipfile /askomics/Pipfile.lock
