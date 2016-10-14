FROM debian:jessie
MAINTAINER guillaumechs

RUN apt-get -y update \
    && apt-get install -y avrdude gcc-avr avr-libc python wget git unzip \
    && git clone https://github.com/TrampolineRTOS/trampoline /home/trampoline \
    && wget -q http://trampoline.rts-software.org/bin/goil-linux-64.zip -O /home/goil-linux-64.zip \
    && unzip -qq /home/goil-linux-64.zip -d /usr/local/bin

CMD export TRAMPOLINE_ROOT='/home/trampoline'
