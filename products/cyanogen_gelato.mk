# Include the stock APNS config file instead of the dev one
PRODUCT_COPY_FILES := \
    vendor/cyanogen/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml \
    device/lge/gelato/files/media/bootanimation.zip:system/media/bootanimation.zip \
    device/lge/gelato/files/media/somebodys.ogg:system/media/audio/ringtones/somebodys.ogg \
    $(PRODUCT_COPY_FILES)

# Inherit device configuration for the thunderc.
$(call inherit-product, device/lge/gelato/device_gelato.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common.mk)

# Include FM-Radio stuff (does not work at this moment)
$(call inherit-product, vendor/cyanogen/products/bcm_fm_radio.mk)

PRODUCT_BRAND := LGE
PRODUCT_DEVICE := gelato
PRODUCT_MODEL := LG-$(SUB_MODEL)
PRODUCT_MANUFACTURER := LGE
PRODUCT_NAME := cyanogen_gelato_$(SUB_MODEL)
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=gelato BUILD_UTC_DATE=0 BUILD_ID=GWK74 BUILD_DISPLAY_ID="GWK74 $(shell date +%m%d%Y)" BUILD_FINGERPRINT=lge/lge_gelato/VM701:2.3.4/GRJ22/ZV4.19cd75186d:user/release-keys PRIVATE_BUILD_DESC="lge_gelato-user 2.3.4 GRJ22 ZV4.19cd75186d release-keys"

# Live wallpaper packages
PRODUCT_PACKAGES += \
        LiveWallpapersPicker \

#CYANOGEN_NIGHTLY := true

ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7.1.0.1-$(shell date +%m%d%Y)-NIGHTLY
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0.1
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0.1-$(PRODUCT_MODEL)-BobZhome-$(shell date +%m%d%Y)
    endif
endif

