# Trampuino
Arduino docker container for Trampoline RTOS cross compilation &amp; flashing on Arduino Uno


# STEP 1 : build docker image

 - Clone/Download this repo.
 - Move to repo folder : `cd <TRAMPOLINO_FOLDER>`
 - Build image : `docker build -t trampuino .`

# STEP 2 : use docker container as a compiler

 - Link Arduino device & Mount local source folder
 - execute : `docker run -v <SRC_FOLDER>:/src --device=/dev/<TTY> -it trampuino /src/<FILE.OIL> <TTY> <APP_NAME.hex>`


# Exemple with blink

 - docker run
 - -v **$(pwd)**:/src
 - --device=**/dev/ttyACM0**
 - -it trampuino /src/**blink.oil** **ttyACM0** **trampuinoBlink.hex**
