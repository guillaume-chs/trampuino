FROM debian:jessie
MAINTAINER guillaumechs

RUN apt-get -y update
RUN apt-get install -y avrdude gcc-avr avr-libc python wget git unzip
RUN git clone https://github.com/TrampolineRTOS/trampoline /home/trampoline
RUN wget -q http://trampoline.rts-software.org/bin/goil-linux-64.zip -O /home/goil-linux-64.zip
RUN unzip -qq /home/goil-linux-64.zip -d /usr/local/bin

ENV TRAMPOLINE_ROOT='/home/trampoline'
COPY trampuine.sh /usr/local/bin/trampuine

ENTRYPOINT trampuine
CMD echo 'Usage : see github.com/TrampolineRTOS/trampoline/tree/master/examples/avr/arduinoUno'
