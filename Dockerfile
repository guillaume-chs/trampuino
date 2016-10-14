FROM debian:latest
MAINTAINER guillaumechs

ENV TRAMPOLINE_ROOT /home/trampoline

RUN apt-get -y update
RUN apt-get install -y avrdude gcc-avr avr-libc python
RUN apt-get install -y wget git unzip
RUN git clone https://github.com/TrampolineRTOS/trampoline /home/trampoline
RUN wget -q http://trampoline.rts-software.org/bin/goil-linux-64.zip -O /home/goil-linux-64.zip
RUN unzip -qq /home/goil-linux-64.zip -d /usr/local/bin

CMD /bin/ls -l /usr/local/bin
CMD export TRAMPOLINE_ROOT='/home/trampoline'
