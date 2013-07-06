#$(call inherit-product, build/target/product/full.mk)

#PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/device/lge/ally/prelink-linux-arm.map
# Inherit from those products. Most specific first
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/ally/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/lge/ally/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_PACKAGES += \
    librs_jni \
	libmm-omxcore \
    libOmxCore \
    brcm_patchram_plus \
    gps.ally \
    copybit.ally

PRODUCT_PACKAGES += \
    flash_image \
    dump_image \
    erase_image \
    e2fsck

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Keylayouts
PRODUCT_COPY_FILES += \
    device/lge/ally/files/ally.kcm.bin:system/usr/keychars/ally.kcm.bin \
    device/lge/ally/files/ally.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/lge/ally/files/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/lge/ally/files/ally.kl:system/usr/keylayout/ally.kl \
    device/lge/ally/files/etc/apns-conf.xml:system/etc/apns-conf.xml \
    device/lge/ally/files/ally.kl:system/usr/keylayout/qwerty.kl 
   
# Board-specific init (does not support charging in "power off" state yet)
PRODUCT_COPY_FILES += \
    device/lge/ally/files/init.ally.rc:root/init.ally.rc \
    device/lge/ally/files/initlogo.rle:root/initlogo.rle \
    device/lge/ally/files/ueventd.ally.rc:root/ueventd.ally.rc \
    device/lge/ally/files/etc/init.local.rc:/system/etc/init.local.rc \
    device/lge/ally/files/init.qcom.post_boot.sh:root/init.qcom.post_boot.sh

# 2D (using proprietary because of poor perfomance of open source libs)
PRODUCT_COPY_FILES += \
    vendor/lge/ally/proprietary/lib/hw/gralloc.default.so:system/lib/hw/gralloc.default.so \
    vendor/lge/ally/proprietary/lib/hw/gralloc.ally.so:system/lib/hw/gralloc.ally.so \

# Sensors
PRODUCT_COPY_FILES += \
    vendor/lge/ally/proprietary/lib/hw/sensors.ally.so:system/lib/hw/sensors.ally.so \
    vendor/lge/ally/proprietary/bin/akmd2:system/bin/akmd2 \
    vendor/lge/ally/proprietary/lib/hw/lights.ally.so:system/lib/hw/lights.ally.so \

# 3D
PRODUCT_COPY_FILES += \
    vendor/lge/ally/proprietary/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    vendor/lge/ally/proprietary/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    vendor/lge/ally/proprietary/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    vendor/lge/ally/proprietary/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    vendor/lge/ally/proprietary/lib/libgsl.so:system/lib/libgsl.so \
    vendor/lge/ally/proprietary/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    vendor/lge/ally/proprietary/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \

# Camera
PRODUCT_COPY_FILES += \
    vendor/lge/ally/proprietary/lib/liboemcamera.so:system/lib/liboemcamera.so \
    vendor/lge/ally/proprietary/lib/libmmipl.so:system/lib/libmmipl.so \
    vendor/lge/ally/proprietary/lib/libmmjpeg.so:system/lib/libmmjpeg.so \


# Wifi
PRODUCT_COPY_FILES += \
    device/lge/ally/files/lib/modules/wireless.ko:system/lib/modules/wireless.ko \
    device/lge/ally/files/lib/modules/tun.ko:system/lib/modules/tun.ko \
    device/lge/ally/files/lib/modules/cifs.ko:system/lib/modules/cifs.ko \
    device/lge/ally/files/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    vendor/lge/ally/proprietary/etc/wl/nvram.txt:system/etc/wl/nvram.txt \
    device/lge/ally/files/etc/dhcpd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    vendor/lge/ally/proprietary/etc/wl/rtecdc.bin:system/etc/wl/rtecdc.bin \
    vendor/lge/ally/proprietary/etc/wl/rtecdc-apsta.bin:system/etc/wl/rtecdc-apsta.bin \
    vendor/lge/ally/proprietary/etc/wl/rtecdc-mfgtest.bin:system/etc/wl/rtecdc-mfgtest.bin

# SD Card
PRODUCT_COPY_FILES += \
    device/lge/ally/files/etc/vold.fstab:system/etc/vold.fstab

# Audio
PRODUCT_COPY_FILES += \
    device/lge/ally/files/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    vendor/lge/ally/proprietary/lib/liba2dp.so:system/lib/liba2dp.so \
    vendor/lge/ally/proprietary/lib/libaudioeq.so:system/lib/libaudioeq.so \
    device/lge/ally/files/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \

# Device permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml 

# LGE services
PRODUCT_COPY_FILES += \
    vendor/lge/ally/proprietary/bin/qmuxd:system/bin/qmuxd \

# rmt_storage (What is this?)
PRODUCT_COPY_FILES += \
    vendor/lge/ally/proprietary/bin/rmt_storage:system/bin/rmt_storage \

# port-bridge (What is this?)
PRODUCT_COPY_FILES += \
    vendor/lge/ally/proprietary/bin/port-bridge:system/bin/port-bridge \

# wipeirface (What is this?)
PRODUCT_COPY_FILES += \
    vendor/lge/ally/proprietary/bin/wiperiface:system/bin/wiperiface \

# Touchscreen firmware updater
PRODUCT_COPY_FILES += \
    vendor/lge/ally/proprietary/bin/tsdown:system/bin/tsdown \
    
# netmgr (What is this?)
PRODUCT_COPY_FILES += \
    vendor/lge/ally/proprietary/bin/netmgrd:system/bin/netmgrd \
    vendor/lge/ally/proprietary/lib/libdsutils.so:system/lib/libdsutils.so \
    vendor/lge/ally/proprietary/lib/libnetmgr.so:system/lib/libnetmgr.so

PRODUCT_COPY_FILES += \
    device/lge/ally/files/etc/apns-conf.xml:system/etc/apns-conf.xml \


PRODUCT_PROPERTY_OVERRIDES += \
    ro.lge.vibrator_amp=125 \
    ro.sf.lcd_density=240 \
    ro.com.google.clientidbase=android-verizon \
    ro.com.google.clientidbase.gmm=android-lge \
    ro.com.google.clientidbase.yt=android-lge \
    ro.cdma.homesystem=64,65,76,77,78,79,80,81,82,83 \
    ro.com.android.dataroaming=true \
    ro.cdma.otaspnumschema=SELC,1,80,99 \
    ro.telephony.call_ring.multiple=false \
    ro.telephony.call_ring.delay=3000 \

# Move dalvik-cache to /data
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1 \

# RIL
PRODUCT_COPY_FILES += \
    vendor/lge/ally/proprietary/lib/libril-qc-1.so:system/lib/libril-qc-1.so \
    vendor/lge/ally/proprietary/lib/liboncrpc.so:system/lib/liboncrpc.so \
    vendor/lge/ally/proprietary/lib/libdsm.so:system/lib/libdsm.so \
    vendor/lge/ally/proprietary/lib/libqueue.so:system/lib/libqueue.so \
    vendor/lge/ally/proprietary/lib/libdiag.so:system/lib/libdiag.so \
    vendor/lge/ally/proprietary/lib/libauth.so:system/lib/libauth.so \
    vendor/lge/ally/proprietary/lib/libcm.so:system/lib/libcm.so \
    vendor/lge/ally/proprietary/lib/libnv.so:system/lib/libnv.so \
    vendor/lge/ally/proprietary/lib/libpbmlib.so:system/lib/libpbmlib.so \
    vendor/lge/ally/proprietary/lib/libwms.so:system/lib/libwms.so \
    vendor/lge/ally/proprietary/lib/libwmsts.so:system/lib/libwmsts.so \
    vendor/lge/ally/proprietary/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    vendor/lge/ally/proprietary/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \
    vendor/lge/ally/proprietary/lib/libgstk_exp.so:system/lib/libgstk_exp.so \
    vendor/lge/ally/proprietary/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
    vendor/lge/ally/proprietary/lib/liboem_rapi.so:system/lib/liboem_rapi.so \
    vendor/lge/ally/proprietary/lib/libsnd.so:system/lib/libsnd.so \
    vendor/lge/ally/proprietary/lib/libqmi.so:system/lib/libqmi.so \
    vendor/lge/ally/proprietary/lib/libdll.so:system/lib/libdll.so \
    vendor/lge/ally/proprietary/lib/liblgerft.so:system/lib/liblgerft.so \
    vendor/lge/ally/proprietary/lib/libbcmwl.so:system/lib/libbcmwl.so \
    vendor/lge/ally/proprietary/lib/libdss.so:system/lib/libdss.so \
    vendor/lge/ally/proprietary/bin/rild:system/bin/rild 

#propietary libril
#PRODUCT_COPY_FILES += \
#    vendor/lge/ally/proprietary/lib/libril.so:system/lib/libril.so \

# OMX
PRODUCT_COPY_FILES += \
    vendor/lge/ally/proprietary/lib/libmm-abl.so:system/lib/libmm-abl.so \
    vendor/lge/ally/proprietary/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    vendor/lge/ally/proprietary/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    vendor/lge/ally/proprietary/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
    vendor/lge/ally/proprietary/lib/libOmxAdpcmDec.so:system/lib/libOmxAdpcmDec.so \
    vendor/lge/ally/proprietary/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
    vendor/lge/ally/proprietary/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
    vendor/lge/ally/proprietary/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
    vendor/lge/ally/proprietary/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
    vendor/lge/ally/proprietary/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
    vendor/lge/ally/proprietary/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    vendor/lge/ally/proprietary/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
    vendor/lge/ally/proprietary/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    vendor/lge/ally/proprietary/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
    vendor/lge/ally/proprietary/lib/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so \
    vendor/lge/ally/proprietary/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    vendor/lge/ally/proprietary/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    vendor/lge/ally/proprietary/lib/libOmxWmvDec.so:system/lib/libOmxWmvDec.so \

# Bluetooth
PRODUCT_COPY_FILES += \
    vendor/lge/ally/proprietary/bin/BCM4329B1_002.002.023.0313.0333.hcd:system/bin/BCM4329B1_002.002.023.0313.0333.hcd \

PRODUCT_LOCALES += hdpi

$(call inherit-product, device/common/gps/gps_us.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := cyanogen_ally
PRODUCT_BRAND := LGE
PRODUCT_DEVICE := ally
PRODUCT_MODEL := LG-Ally
PRODUCT_MANUFACTURER := LGE
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=ally
