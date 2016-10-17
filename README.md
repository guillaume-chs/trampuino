# trampolino
Arduino docker container for Trampoline RTOS cross compilation &amp; flashing on Arduino Uno


# STEP 1 : build docker image

 - Clone/Download this repo.
 - Move to repo folder : `cd <TRAMPOLINO_FOLDER>`
 - Build image : `docker build -t trampolino .`

# STEP 2 : use docker container as a compiler

 - Link Arduino device & Mount local source folder
 - execute : `docker run -v $(pwd):/home -it --device=/dev/ttyACM0 trampolino:latest /home/blink.oil ttyACM0 <APP_NAME>`
