#!/bin/bash
source ../rtos/export.sh
mkdir -p build
${IDF_PATH}/tools/mkspiffs/mkspiffs --create data/ --page 256 --size 2097152 build/storage.bin --debug 5