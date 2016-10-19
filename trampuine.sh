#!/bin/bash

FILE="$1"
if [ ! -f $FILE ]; then
   echo "File $FILE not found."
fi

TTY="$2"
if [ -z ${TTY+x} ]; then
   echo "No tty is specified"
fi

APP_NAME="$3"
if [ -z ${APP_NAME+x} ]; then
   echo "No app name was given"
fi

echo "File : $FILE"
echo "TTY : /dev/$TTY"
echo "App Name : $APP_NAME"


# Move to src folder
cd ${FILE%*/*}

# Execute compile & flash scripts
goil --target=avr/arduino/uno --templates="$TRAMPOLINE_ROOT/goil/templates/" "$FILE" && {
    ./make.py && {
	avrdude -c arduino -p m328p -P "/dev/$TTY" -U flash:w:$APP_NAME.hex
    }
}
