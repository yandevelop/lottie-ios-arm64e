TARGET := iphone:clang:18.0:14.0
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

FRAMEWORK_NAME = Lottie

Lottie_FILES = $(shell find Sources -name '*.swift')
Lottie_SWIFTFLAGS = -enable-library-evolution

include $(THEOS_MAKE_PATH)/framework.mk

after-Lottie-all::
	@mkdir -p $(THEOS_OBJ_DIR)/Lottie.framework/Modules/Lottie.swiftmodule
	@cp module.modulemap $(THEOS_OBJ_DIR)/Lottie.framework/Modules
	@for arch in $(ARCHS); do \
		for file in swiftdoc swiftmodule abi.json; do \
			cp $(THEOS_OBJ_DIR)/$$arch/Lottie.$$file $(THEOS_OBJ_DIR)/Lottie.framework/Modules/Lottie.swiftmodule/$$arch-apple-ios.$$file; \
		done; \
	done