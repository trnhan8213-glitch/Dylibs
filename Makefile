TARGET := iphone:clang:latest:14.0
SYSROOT = $(THEOS)/sdks/iPhoneOS14.5.sdk
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = TrNhanLiquid
TrNhanLiquid_FILES = Tweak.x
TrNhanLiquid_CFLAGS = -fobjc-arc
TrNhanLiquid_FRAMEWORKS = UIKit CoreGraphics QuartzCore
TrNhanLiquid_PRIVATE_FRAMEWORKS = MaterialKit

include $(THEOS_MAKE_PATH)/tweak.mk
