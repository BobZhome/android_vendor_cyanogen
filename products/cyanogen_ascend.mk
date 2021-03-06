# Inherit AOSP device configuration for Ascend.
$(call inherit-product, device/huawei/ascend/ascend.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

#
# Setup device specific product configuration.
#
# PRODUCT_NAME := cyanogen_ascend
# PRODUCT_BRAND := huawei
# PRODUCT_DEVICE := ascend
# PRODUCT_MODEL := M860
# PRODUCT_MANUFACTURER := Huawei
# PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=huawei_ascend TARGET_DEVICE=ascend BUILD_ID=GRJ22 BUILD_DISPLAY_ID=GRJ22 BUILD_FINGERPRINT=google/soju/crespo:2.3.4/GRJ22/121341:user/release-keys PRIVATE_BUILD_DESC="user 2.3.4 GRJ22 121341 release-keys"

PRODUCT_NAME := cyanogen_ascend
PRODUCT_BRAND := google
PRODUCT_DEVICE := ascend
PRODUCT_MODEL := M860
PRODUCT_MANUFACTURER := Huawei
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=ascend BUILD_ID=GWK74 BUILD_DISPLAY_ID=GWK74 BUILD_FINGERPRINT=google/passion/passion:2.3.5/GRJ22/121341:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.5 GRJ22 121341 release-keys"

#PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/vendor/cyanogen/prelink-linux-arm-ascend.map

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
        CMVERSION := CyanogenMod-7.2.0-RC1-$(shell date +%Y%m%d)-NIGHTLY
else
    ifdef CYANOGEN_RELEASE
        CMVERSION := CyanogenMod-7.2.0-RC1
    else
        CMVERSION := CyanogenMod-7.2.0-RC1-$(PRODUCT_MODEL)-BobZhome-$(shell date +%Y%m%d)
    endif
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=$(CMVERSION)

#
# Copy legend specific prebuilt files
#
PRODUCT_COPY_FILES += \
    vendor/cyanogen/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip \
    vendor/cyanogen/prebuilt/mdpi/media/follow.ogg:system/media/audio/ringtones/follow.ogg \
    vendor/cyanogen/prebuilt/mdpi/media/somebodys.ogg:system/media/audio/ringtones/somebodys.ogg \

