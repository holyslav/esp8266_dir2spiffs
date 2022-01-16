cmake_minimum_required(VERSION 3.5)

include($ENV{IDF_PATH}/tools/cmake/project.cmake)

project(spiffs_test)

idf_build_get_property(idf_path IDF_PATH)
idf_build_get_property(build_dir BUILD_DIR)
idf_build_get_property(project_dir PROJECT_DIR)

partition_table_get_partition_info(storage_size "--partition-type data --partition-subtype spiffs" "size")

add_custom_command(OUTPUT "${build_dir}/storage.bin"
    COMMAND ${idf_path}/tools/mkspiffs/mkspiffs --create ${project_dir}/data --page 256 --size ${storage_size} ${build_dir}/storage.bin
    VERBATIM
    WORKING_DIRECTORY ${build_dir}
    COMMENT "Generating spiffs binary image from directory /data")
add_custom_target(storage DEPENDS "${build_dir}/storage.bin")
esptool_py_flash_project_args(storage 0x110000 "${build_dir}/storage.bin" FLASH_IN_PROJECT)
esptool_py_custom_target(storage-flash storage "storage")
esptool_py_custom_target(flash-all storage "app;partition_table;bootloader;storage")