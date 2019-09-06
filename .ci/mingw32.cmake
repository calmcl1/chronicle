SET(CMAKE_SYSTEM_NAME Windows)
#set(COMPILER_TRIPLET "x86_64-w64-mingw32")

if((NOT $ENV{COMPILER_TRIPLET} OR $ENV{COMPILER_TRIPLET} STREQUAL "") AND ${CMAKE_CROSSCOMPILING})
    message(WARNING "COMPILER_TRIPLET not found; Setting manually to x86_64-w64-mingw32")
    set(COMPILER_TRIPLET "x86_64-w64-mingw32")
endif()

if ("$ENV{COMPILER_TRIPLET}" STREQUAL "x86_64-w64-mingw32")
    set(CMAKE_SYSTEM_PROCESSOR AMD64)
else ()
    set(CMAKE_SYSTEM_PROCESSOR x86)
endif()

#message(STATUS "Using toolchain for platform: ${COMPILER_TRIPLET}")

include(CMakeForceCompiler)

set(CMAKE_C_COMPILER "/usr/bin/${COMPILER_TRIPLET}-gcc")
set(CMAKE_CXX_COMPILER "/usr/bin/${COMPILER_TRIPLET}-g++")
set(CMAKE_PREFIX_PATH "/usr/${COMPILER_TRIPLET}")
set(BOOST_DEBUG ON)
SET(BOOST_ROOT "/usr/${COMPILER_TRIPLET}/include/boost-1_68")
SET(BOOST_LIBRARYDIR "/usr/${COMPILER_TRIPLET}/lib")

if(COMPILER_TRIPLET STREQUAL "x86_64-w64-mingw32")
    set(Boost_ARCHITECTURE "-x64")
else()
    set(Boost_ARCHITECTURE "-i686")
endif()

set(Boost_USE_DEBUG_RUNTIME OFF)

SET(CMAKE_FIND_ROOT_PATH "/usr/${COMPILER_TRIPLET}" "/usr/${COMPILER_TRIPLET}/include/boost-1_68")
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)