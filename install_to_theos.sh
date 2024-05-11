#!/bin/sh

echo "Copying framework"

mkdir -p "$THEOS/lib/iphone/rootless"
cp -R "./Vendor/Rootless/Lottie.framework" "$THEOS/lib/iphone/rootless/Lottie.framework"
cp -R "./Vendor/Rootful/Lottie.framework" "$THEOS/lib/Lottie.framework"

mkdir -p "$THEOS/include/Lottie"
cp "./Vendor/Lottie-Wrapper.h" "$THEOS/include/Lottie/Lottie-Wrapper.h"

echo "Successfully installed Lottie"
echo ""
echo "You can now use Lottie in your projects by adding the following to your Makefile:"
echo "\$(TWEAK_NAME)_FRAMEWORKS = Lottie"

exit 0