TARGET := iphone:clang:latest:14.0
INSTALL_TARGET_PROCESSES = SpringBoard
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = TrNhanLiquid
TrNhanLiquid_FILES = Tweak.x
TrNhanLiquid_CFLAGS = -fobjc-arc
TrNhanLiquid_FRAMEWORKS = UIKit CoreGraphics

include $(THEOS_MAKE_PATH)/tweak.mk
