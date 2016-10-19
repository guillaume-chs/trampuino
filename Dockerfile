FROM debian:jessie
MAINTAINER guillaumechs

ENV TRAMPOLINE_ROOT='/home/trampoline'

RUN apt-get -y update
RUN apt-get install -y avrdude gcc-avr avr-libc python gcc g++ git
RUN git clone https://github.com/guillaume-chs/trampoline-for-docker-trampuino $TRAMPOLINE_ROOT
RUN $TRAMPOLINE_ROOT/goil/makefile-unix/install.py

# Optionnal
RUN apt-get autoremove -y gcc g++ git


COPY trampuine.sh /usr/local/bin/trampuine
ENTRYPOINT ["trampuine"]

