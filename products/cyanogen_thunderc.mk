# Include the stock APNS config file instead of the dev one
PRODUCT_COPY_FILES := \
    vendor/cyanogen/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml \
    vendor/cyanogen/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip \
    vendor/cyanogen/prebuilt/mdpi/media/follow.ogg:system/media/audio/ringtones/follow.ogg \
    vendor/cyanogen/prebuilt/mdpi/media/somebodys.ogg:system/media/audio/ringtones/somebodys.ogg \
    $(PRODUCT_COPY_FILES)

# Inherit device configuration for the thunderc.
$(call inherit-product, device/lge/thunderc/device_thunderc.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Include FM-Radio stuff (does not work at this moment)
$(call inherit-product, vendor/cyanogen/products/bcm_fm_radio.mk)

PRODUCT_BRAND := LGE
PRODUCT_DEVICE := thunderc
PRODUCT_MODEL := LG-$(SUB_MODEL)
PRODUCT_MANUFACTURER := LGE
PRODUCT_NAME := cyanogen_thunderc_$(SUB_MODEL)
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0 BUILD_ID=GRJ22 BUILD_DISPLAY_ID=GRJ90 BUILD_FINGERPRINT=google/passion/passion:2.3.5/GRJ22/121341:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.5 GRJ22 121341 release-keys"

# Live wallpaper packages
PRODUCT_PACKAGES += \
        LiveWallpapersPicker \

#CYANOGEN_NIGHTLY := true

ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7-$(shell date +%m%d%Y)-NIGHTLY-$(PRODUCT_MODEL)-IHO
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1-RC1-$(PRODUCT_MODEL)
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1-RC1-$(PRODUCT_MODEL)-BobZhome-$(shell date +%m%d%Y)
    endif
endif

