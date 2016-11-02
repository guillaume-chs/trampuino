FROM debian:jessie
MAINTAINER guillaumechs

ENV TRAMPOLINE_ROOT='/home/trampoline'

RUN apt-get -y update \
    && apt-get install -y avrdude gcc-avr avr-libc python gcc g++ git sudo \
    && git clone https://github.com/guillaume-chs/trampoline-for-docker-trampuino $TRAMPOLINE_ROOT \
    && $TRAMPOLINE_ROOT/goil/makefile-unix/install.py \
    && apt-get autoremove -y gcc g++ git


RUN apt-get install -y dos2unix
COPY trampuine.sh /usr/local/bin/trampuine
RUN dos2unix /usr/local/bin/trampuine

ENTRYPOINT ["trampuine"]
