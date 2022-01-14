# SPIFFS example

Unlike the example from the ESP-RTOS-SDK, added spiffs auto-generation of a binary file based on the data folder, modified the RTOS-SDK so that the binary file is automatically added to the list of loader files

## How to use example
```
./rebuild.sh && ./flash.sh && ./monitor.sh
```

### Hardware required
```
ESP8266
```

### Configure the project
```
cmake -B build && cmake --build build --target menuconfig
```

### Build and flash
Build the project and flash it to the board, then run monitor tool to view serial output:
```
./genspiffs.sh && ./build.sh && ./flash.sh && ./monitor.sh
```

(To exit the serial monitor, type ``Ctrl-]``.)

## Example output
```
I (43) boot: ESP-IDF v3.4-53-g83517ba1-dirty 2nd stage bootloader
I (44) qio_mode: Enabling default flash chip QIO
I (52) boot: SPI Speed      : 40MHz
I (58) boot: SPI Mode       : QIO
I (64) boot: SPI Flash Size : 4MB
I (70) boot: Partition Table:
I (76) boot: ## Label            Usage          Type ST Offset   Length
I (87) boot:  0 nvs              WiFi data        01 02 00009000 00006000
I (98) boot:  1 phy_init         RF data          01 01 0000f000 00001000
I (109) boot:  2 factory          factory app      00 00 00010000 00100000
I (121) boot:  3 storage          Unknown data     01 82 00110000 00200000
I (132) boot: End of partition table
I (206) boot: Loaded app from partition at offset 0x10000
I (233) example: Initializing SPIFFS. max_files: 17
I (328) example: Partition size: total: 1920401, used: 502
I (329) example: Reading file
I (332) example: Read from file: 'Hello world!'
I (335) example: SPIFFS unmounted
```

To erase the contents of SPIFFS partition, run `cmake -B build && cmake --build build --target erase_flash`, if using CMake build system). Then upload the example again as described above.
