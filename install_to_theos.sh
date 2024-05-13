#!/bin/sh
set -e

echo "Building Lottie from source, this may take a while"

rm -rf ./packages

echo "Building rootful"
make clean > /dev/null
make stage FINALPACKAGE=1 > /dev/null

echo "Building rootless"
make clean > /dev/null
make stage THEOS_PACKAGE_SCHEME=rootless > /dev/null

mkdir -p "$THEOS/include/Lottie"
cp "./Vendor/Lottie-Wrapper.h" "$THEOS/include/Lottie/Lottie-Wrapper.h"

echo "Successfully installed Lottie"

exit 0