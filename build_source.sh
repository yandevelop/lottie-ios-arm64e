#!/bin/sh
set -e

echo "Building Lottie from source, this may take a while"

rm -rf ./packages
rm -rf "$THEOS/lib/Lottie.framework"
rm -rf "$THEOS/lib/iphone/rootless/Lottie.framework"

echo "Building rootful"
make clean > /dev/null
make clean package FINALPACKAGE=1 > /dev/null

echo "Building rootless"
make clean > /dev/null
make clean package FINALPACKAGE=1 THEOS_PACKAGE_SCHEME=rootless > /dev/null

cp "./Vendor/Lottie-Wrapper.h" "$THEOS/include/Lottie/Lottie-Wrapper.h"

echo "Successfully installed Lottie"

exit 0