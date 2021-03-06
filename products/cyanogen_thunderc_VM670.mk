SUB_MODEL := VM670

# Include the stock APNS config file instead of the dev one
PRODUCT_COPY_FILES := \
    vendor/cyanogen/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml \
    device/lge/thunderc/files/media/bootanimation.zip:system/media/bootanimation.zip \
    device/lge/thunderc/files/media/somebodys.ogg:system/media/audio/ringtones/somebodys.ogg \
    device/lge/thunderc/files/media/Clockopia.ttf:system/fonts/Clockopia.ttf \
    device/lge/thunderc/files/media/DroidSans.ttf:system/fonts/DroidSans.ttf \
    device/lge/thunderc/files/media/DroidSans-Bold.ttf:system/fonts/DroidSans-Bold.ttf \
    $(PRODUCT_COPY_FILES)

# Inherit device configuration for the thunderc.
$(call inherit-product, device/lge/thunderc/device_thunderc.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common.mk)

# Include FM-Radio stuff (does not work at this moment)
$(call inherit-product, vendor/cyanogen/products/bcm_fm_radio.mk)

PRODUCT_BRAND := LGE
PRODUCT_DEVICE := thunderc
PRODUCT_MODEL := LG-$(SUB_MODEL)
PRODUCT_MANUFACTURER := LGE
PRODUCT_NAME := cyanogen_thunderc_$(SUB_MODEL)
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=thunderc BUILD_UTC_DATE=0 BUILD_ID=GWK74 BUILD_DISPLAY_ID="GWK74" BUILD_FINGERPRINT=lge/lge_gelato/VM701:2.3.4/GRJ22/ZV4.19cd75186d:user/release-keys PRIVATE_BUILD_DESC="lge_gelato-user 2.3.4 GRJ22 ZV4.19cd75186d release-keys"

# Live wallpaper packages
PRODUCT_PACKAGES += \
        LiveWallpapersPicker \

#CYANOGEN_NIGHTLY := true

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
