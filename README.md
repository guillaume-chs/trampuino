# trampolino
Arduino docker container for Trampoline RTOS cross compilation &amp; flashing on Arduino Uno


# HOW-TO : docker part

 - Build image : `docker build -t <IMAGE_NAME> .`
 - Start linking serial port : `docker run -it --device=/dev/<ARDUINO_TTY> <IMAGE_NAME> /bin/bash`

# HOW-TO : compiling part

 - Go to your sources root folder : `cd <SOURCES_FOLDER>`
 - Compile using goil : `goil --target=avr/arduino/uno --templates=$TRAMPOLINE_ROOT/goil/templates/ <FILE>.oil`
 - Call generated make python script : `./make.py`
 - Flash on connected Arduino Uno : `avrdude -c arduino -p m328p -P /dev/<ARDUINO_TTY> -U flash:w:<GENERATED_FILE>.hex`
