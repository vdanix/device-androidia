# ----------------- BEGIN MIX-IN DEFINITIONS -----------------
# Mix-In definitions are auto-generated by mixin-update
##############################################################
# Source: device/intel/mixins/groups/dynamic-partitions/true/product.mk
##############################################################
# Enable dynamic partitions feature
PRODUCT_USE_DYNAMIC_PARTITIONS := true

#Enable userspace fastboot
PRODUCT_PACKAGES += fastbootd \
                    android.hardware.fastboot@1.0-impl-mock

#copy fstab to ramdisk
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/fstab:$(TARGET_COPY_OUT_RAMDISK)/fstab.$(TARGET_PRODUCT)
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/fstab:$(PRODUCT_OUT)/recovery/root/first_stage_ramdisk/fstab.$(TARGET_PRODUCT)

SUPER_IMG_IN_FLASHZIP := true
##############################################################
# Source: device/intel/mixins/groups/slot-ab/true/product.mk
##############################################################
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_client \
    update_verifier \
    libavb \
    update_engine_sideload \
    avbctl \
    android.hardware.boot@1.1-impl \
    android.hardware.boot@1.1-impl.recovery \
    android.hardware.boot@1.1-service

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.bootctrl=intel

PRODUCT_PACKAGES_DEBUG += \
    bootctl

PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/slot-ab/postinstall.sh:vendor/bin/postinstall
PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/slot-ab/postinstall.sh:recovery/root/vendor/bin/postinstall
##############################################################
# Source: device/intel/mixins/groups/boot-arch/project-celadon/product.mk
##############################################################
TARGET_UEFI_ARCH := x86_64

# Android Kernelflinger uses the OpenSSL library to support the
# bootloader policy
KERNELFLINGER_SSL_LIBRARY := boringssl

BIOS_VARIANT := release


PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/fstab:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.$(TARGET_PRODUCT)

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.verified_boot.xml:vendor/etc/permissions/android.software.verified_boot.xml

# Allow Kernelflinger to ignore the non-standard RSCI ACPI table
# to get reset and wake source from PMIC for bringup phase if
# the table reports incorrect data
KERNELFLINGER_IGNORE_RSCI := true
# OEM Unlock reporting
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.oem_unlock_supported=1
# Allow Kernelflinger to ignore the RSCI reset source "not_applicable"
# when setting the bootreason
KERNELFLINGER_IGNORE_NOT_APPLICABLE_RESET := true

KERNELFLINGER_SUPPORT_SELF_USB_DEVICE_MODE_PROTOCOL := true

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.frp.pst=/dev/block/by-name/persistent

# Enable fs-verity
PRODUCT_PROPERTY_OVERRIDES += ro.apk_verity.mode=2

# Enable metadata encryption
PRODUCT_PROPERTY_OVERRIDES += \
	   ro.crypto.dm_default_key.options_format.version=2

PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/boot-arch/update_ifwi_ab.sh:vendor/bin/update_ifwi_ab
PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/boot-arch/update_ifwi_ab.sh:recovery/root/vendor/bin/update_ifwi_ab

$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

KERNELFLINGER_SUPPORT_KEYBOX_PROVISION := true
##############################################################
# Source: device/intel/mixins/groups/wlan/iwlwifi/product.mk
##############################################################
PRODUCT_PACKAGES += \
    hostapd \
    hostapd_cli \
    wificond \
    wifilogd \
    wpa_supplicant \
    wpa_cli \
    iw \
    TetheringConfigOverlay \
    TetheringConfigOverlayGsi

PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service

#copy iwlwifi wpa config files
PRODUCT_COPY_FILES += \
    $(INTEL_PATH_COMMON)/wlan/wpa_supplicant-common.conf:vendor/etc/wifi/wpa_supplicant.conf \
    $(INTEL_PATH_COMMON)/wlan/iwlwifi/wpa_supplicant_overlay.conf:vendor/etc/wifi/wpa_supplicant_overlay.conf \
    $(INTEL_PATH_COMMON)/wlan/iwlwifi/p2p_supplicant_overlay.conf:vendor/etc/wifi/p2p_supplicant_overlay.conf \
    frameworks/native/data/etc/android.hardware.wifi.xml:vendor/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:vendor/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:vendor/etc/permissions/android.software.ipsec_tunnels.xml

PRODUCT_PACKAGE_OVERLAYS += $(INTEL_PATH_COMMON)/wlan/overlay-disable_keepalive_offload
##############################################################
# Source: device/intel/mixins/groups/kernel/gmin64/product.mk.1
##############################################################
TARGET_KERNEL_ARCH := x86_64

##############################################################
# Source: device/intel/mixins/groups/kernel/gmin64/product.mk
##############################################################

KERNEL_MODULES_ROOT_PATH ?= vendor/lib/modules
KERNEL_MODULES_ROOT ?= $(KERNEL_MODULES_ROOT_PATH)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.vendor.boot.moduleslocation=/$(KERNEL_MODULES_ROOT_PATH)
##############################################################
# Source: device/intel/mixins/groups/sepolicy/enforcing/product.mk
##############################################################
PRODUCT_PACKAGES += sepolicy-areq-checker
##############################################################
# Source: device/intel/mixins/groups/bluetooth/btusb/product.mk
##############################################################
PRODUCT_PACKAGES += \
    hciconfig

# Bluetooth tools eng / userdebug
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    btmon \
    hcitool
endif

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:vendor/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:vendor/etc/permissions/android.hardware.bluetooth_le.xml

PRODUCT_PROPERTY_OVERRIDES += bluetooth.rfkill=1

PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-service.vbt \
    libbt-vendor \


PRODUCT_PACKAGE_OVERLAYS += $(INTEL_PATH_COMMON)/bluetooth/overlay-tablet

##############################################################
# Source: device/intel/mixins/groups/audio/project-celadon/product.mk
##############################################################
TARGET_BOARD_PLATFORM := celadon

# Tinyalsa
PRODUCT_PACKAGES_DEBUG += \
    tinymix \
    tinyplay \
    tinycap \
    tinypcminfo \
    tinyprobe

# Audio HALs
PRODUCT_PACKAGES += meta.package.audio

# Sound Trigger HAL
PRODUCT_PACKAGES += \
       sound_trigger.primary.$(TARGET_BOARD_PLATFORM)

# Audio Primary HAL
PRODUCT_PACKAGES += \
       audio.primary.$(TARGET_BOARD_PLATFORM)

# Extended Audio HALs
PRODUCT_PACKAGES += \
    audio.r_submix.default \
    audio.usb.default \
    audio.usb.$(TARGET_BOARD_PLATFORM) \
    audio.hdmi.$(TARGET_BOARD_PLATFORM) \
    audio_policy.default.so \
    audio_configuration_files

# Audio HAL
PRODUCT_PACKAGES += \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.audio@6.0-impl \
    android.hardware.audio@2.0-service

#Audio policy engine configuration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/default/policy/audio_policy_criteria.conf:vendor/etc/audio_policy_criteria.conf

# Vendor audio configuration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/default/policy/audio_policy_configuration.xml:vendor/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/default/policy/a2dp_audio_policy_configuration.xml:vendor/etc/a2dp_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/default/policy/r_submix_audio_policy_configuration.xml:vendor/etc/r_submix_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/default/policy/usb_audio_policy_configuration.xml:vendor/etc/usb_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/default/policy/hdmi_audio_policy_configuration.xml:vendor/etc/hdmi_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/default/policy/audio_policy_volumes.xml:vendor/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio/default/policy/default_volume_tables.xml:vendor/etc/default_volume_tables.xml \
    $(LOCAL_PATH)/audio/default/effect/audio_effects.xml:vendor/etc/audio_effects.xml
ifeq ($(BASE_YOCTO_KERNEL), true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/default/mixer_paths_ehl.xml:vendor/etc/mixer_paths_0.xml \
    $(LOCAL_PATH)/audio/default/mixer_paths_usb.xml:vendor/etc/mixer_paths_usb.xml

PRODUCT_PROPERTY_OVERRIDES += ro.vendor.hdmi.audio=ehl
else
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/default/mixer_paths_0.xml:vendor/etc/mixer_paths_0.xml
endif

#fallback
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/default/policy/fallback/audio_policy_configuration_generic.xml:system/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/default/policy/fallback/primary_audio_policy_configuration.xml:system/etc/primary_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/default/policy/fallback/r_submix_audio_policy_configuration.xml:system/etc/r_submix_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/default/policy/fallback/audio_policy_volumes.xml:system/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio/default/policy/fallback/default_volume_tables.xml:system/etc/default_volume_tables.xml


PRODUCT_PROPERTY_OVERRIDES += audio.safemedia.bypass=true

PRODUCT_PACKAGE_OVERLAYS += $(INTEL_PATH_COMMON)/audio/overlay-car-legacy
##############################################################
# Source: device/intel/mixins/groups/device-type/tablet/product.mk
##############################################################
PRODUCT_CHARACTERISTICS := tablet

PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/tablet_core_hardware.xml:vendor/etc/permissions/tablet_core_hardware.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:vendor/etc/permissions/android.software.freeform_window_management.xml

##############################################################
# Source: device/intel/mixins/groups/device-specific/caas_cfc/product.mk
##############################################################
TARGET_BOARD_PLATFORM := celadon

ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_REQUIRES_INSECURE_EXECMEM_FOR_SWIFTSHADER := true
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.recovery.rc:root/init.recovery.$(TARGET_PRODUCT).rc \
    $(LOCAL_PATH)/init.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.$(TARGET_PRODUCT).rc \
    $(LOCAL_PATH)/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc \

PRODUCT_PACKAGES += vndservicemanager \
                    hwcomposer.remote

PRODUCT_PACKAGES += \
    ServiceAgent \
    pm_agent_client

PRODUCT_PACKAGES += android.hardware.keymaster@3.0-impl \
                    android.hardware.keymaster@3.0-service \
                    android.hardware.usb@1.0-impl \
                    android.hardware.usb@1.0-service \
                    camera.device@1.0-impl \
                    android.hardware.camera.provider@2.4-impl \
                    android.hardware.graphics.mapper@4.0-impl.minigbm \
                    android.hardware.graphics.allocator@4.0-service.minigbm \
                    android.hardware.renderscript@1.0-impl \
                    android.hardware.graphics.composer@2.4-service


PRODUCT_PROPERTY_OVERRIDES += ro.control_privapp_permissions=enforce
PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.useautofastjni=true
PRODUCT_PRODUCT_PROPERTIES += persist.adb.tcp.port=5555

PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.volume.metadata.method=dm-default-key \
    ro.crypto.dm_default_key.options_format.version=2 \
    ro.crypto.volume.options=::v2

PRODUCT_COPY_FILES += vendor/intel/app_icon_manager/host/bins/cfc-0.1.0-x64.deb:$(PRODUCT_OUT)/scripts/cfc-0.1.0-x64.deb

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.device_admin.xml:vendor/etc/permissions/android.software.device_admin.xml \
    frameworks/native/data/etc/android.software.managed_users.xml:vendor/etc/permissions/android.software.managed_users.xml \
    frameworks/native/data/etc/android.software.secure_lock_screen.xml:vendor/etc/permissions/android.software.secure_lock_screen.xml

PRODUCT_COPY_FILES += $(LOCAL_PATH)/file_share.sh:$(TARGET_COPY_OUT_VENDOR)/bin/file_share.sh
PRODUCT_COPY_FILES += vendor/intel/utils/LICENSE:$(PRODUCT_OUT)/LICENSE
PRODUCT_COPY_FILES += $(LOCAL_PATH)/auto_switch_pt_usb_vms.sh:$(PRODUCT_OUT)/scripts/auto_switch_pt_usb_vms.sh
PRODUCT_COPY_FILES += $(LOCAL_PATH)/findall.py:$(PRODUCT_OUT)/scripts/findall.py
PRODUCT_COPY_FILES += $(LOCAL_PATH)/sof_audio/configure_sof.sh:$(PRODUCT_OUT)/scripts/sof_audio/configure_sof.sh
PRODUCT_COPY_FILES += $(LOCAL_PATH)/setup_audio_host.sh:$(PRODUCT_OUT)/scripts/setup_audio_host.sh
PRODUCT_COPY_FILES += $(LOCAL_PATH)/sof_audio/blacklist-dsp.conf:$(PRODUCT_OUT)/scripts/sof_audio/blacklist-dsp.conf
PRODUCT_COPY_FILES += $(LOCAL_PATH)/guest_pm_control:$(PRODUCT_OUT)/scripts/guest_pm_control
PRODUCT_COPY_FILES += $(LOCAL_PATH)/intel-thermal-conf.xml:$(PRODUCT_OUT)/scripts/intel-thermal-conf.xml
PRODUCT_COPY_FILES += $(LOCAL_PATH)/thermald.service:$(PRODUCT_OUT)/scripts/thermald.service
PRODUCT_COPY_FILES += device/intel/civ/host/vm-manager/scripts/start_civ.sh:$(PRODUCT_OUT)/scripts/start_civ.sh
PRODUCT_COPY_FILES += device/intel/civ/host/vm-manager/scripts/setup_host.sh:$(PRODUCT_OUT)/scripts/setup_host.sh
PRODUCT_COPY_FILES += device/intel/civ/host/vm-manager/scripts/guest_time_keeping.sh:$(PRODUCT_OUT)/scripts/guest_time_keeping.sh
PRODUCT_COPY_FILES += device/intel/civ/host/vm-manager/scripts/start_flash_usb.sh:$(PRODUCT_OUT)/scripts/start_flash_usb.sh
PRODUCT_COPY_FILES += vendor/intel/fw/trusty-release-binaries/rpmb_dev:$(PRODUCT_OUT)/scripts/rpmb_dev
PRODUCT_COPY_FILES += $(LOCAL_PATH)/wakeup.py:$(PRODUCT_OUT)/scripts/wakeup.py
PRODUCT_COPY_FILES += $(LOCAL_PATH)/cfc_example.sh:$(PRODUCT_OUT)/scripts/cfc_example.sh
##############################################################
# Source: device/intel/mixins/groups/trusty/false/product.mk
##############################################################
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service.software
##############################################################
# Source: device/intel/mixins/groups/vendor-partition/true/product.mk
##############################################################

PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/vendor-partition/sh_recovery:recovery/root/vendor/bin/sh
PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/vendor-partition/mkshrc_recovery:recovery/root/vendor/etc/mkshrc
PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/vendor-partition/toolbox_recovery:recovery/root/vendor/bin/toolbox_static
PRODUCT_PACKAGES += \
     toybox_static \
     toybox_vendor \
##############################################################
# Source: device/intel/mixins/groups/product-partition/true/product.mk
##############################################################

##############################################################
# Source: device/intel/mixins/groups/odm-partition/true/product.mk
##############################################################

##############################################################
# Source: device/intel/mixins/groups/display-density/medium/product.mk
##############################################################
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := mdpi

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.sf.lcd_density=160
##############################################################
# Source: device/intel/mixins/groups/dalvik-heap/tablet-10in-xhdpi-2048/product.mk
##############################################################
include frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk

##############################################################
# Source: device/intel/mixins/groups/media/auto/product.mk
##############################################################
# libstagefrighthw
PRODUCT_PACKAGES += \
    libstagefrighthw

# Media SDK and OMX IL components
PRODUCT_PACKAGES += \
    libmfxhw32 \
    libmfx_omx_core \
    libmfx_omx_components_hw

# Open source media_driver
PRODUCT_PACKAGES += i965_drv_video
PRODUCT_PACKAGES += libigfxcmrt

# Open source hdcp
PRODUCT_PACKAGES += libhdcpsdk
PRODUCT_PACKAGES += lihdcpcommon

ifeq ($(BOARD_USE_64BIT_USERSPACE),true)
PRODUCT_PACKAGES += \
    libmfxhw64
endif


BOARD_HAVE_MEDIASDK_OPEN_SOURCE := true

BOARD_HAVE_OMX_SRC := true

PRODUCT_PACKAGES += \
    libpciaccess
##############################################################
# Source: device/intel/mixins/groups/graphics/auto/product.mk
##############################################################
PRODUCT_PACKAGES += \
    libEGL_swiftshader \
    libGLESv1_CM_swiftshader \
    libGLESv2_swiftshader \
    libGLES_mesa \
    libGLES_android \
    libigdrcl \
    libOpenCL \
    libcommon_clang \
    libigc \
    libigdfcl

PRODUCT_PACKAGES += \
    libdrm \
    libdrm_intel \
    libsync \
    libmd

PRODUCT_PACKAGES += \
    gralloc.default

PRODUCT_PACKAGES += ufo_prebuilts

#Surface Flinger related Properties

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.max_frame_buffer_acquired_buffers=3

# System's VSYNC phase offsets in nanoseconds
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.vsync_event_phase_offset_ns=7500000
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.vsync_sf_event_phase_offset_ns=3000000

# i915 firmwares
$(foreach fw,$(I915_FW),$(eval PRODUCT_PACKAGES += $(notdir $(fw))))

# move configure files provided by intel to vendor partition
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/extra_files/graphics/drirc:vendor/etc/drirc

# DRM HWComposer
PRODUCT_PACKAGES += \
    hwcomposer.drm_minigbm

# HWComposer IA
PRODUCT_PACKAGES += \
    hwcomposer.$(TARGET_GFX_INTEL)

INTEL_HWC_CONFIG := $(INTEL_PATH_VENDOR)/external/hwcomposer-intel

ifeq ($(findstring _acrn,$(TARGET_PRODUCT)),_acrn)
PRODUCT_COPY_FILES += $(INTEL_HWC_CONFIG)/hwc_display_virt.ini:$(TARGET_COPY_OUT_VENDOR)/etc/hwc_display.ini
else
PRODUCT_COPY_FILES += $(INTEL_HWC_CONFIG)/hwc_display.ini:$(TARGET_COPY_OUT_VENDOR)/etc/hwc_display.ini
PRODUCT_COPY_FILES += $(INTEL_HWC_CONFIG)/hwc_display.kvm.ini:$(TARGET_COPY_OUT_VENDOR)/etc/hwc_display.kvm.ini
endif

# Mini gbm

PRODUCT_PACKAGES += \
    gralloc.$(TARGET_GFX_INTEL)



# Mesa
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:vendor/etc/permissions/android.hardware.opengles.aep.xml

# GLES version
PRODUCT_PROPERTY_OVERRIDES += \
   ro.opengles.version=196610

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:vendor/etc/permissions/android.hardware.vulkan.level.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:vendor/etc/permissions/android.hardware.vulkan.compute.xml


PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:vendor/etc/permissions/android.hardware.vulkan.version.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:vendor/etc/permissions/android.software.vulkan.deqp.level.xml

PRODUCT_PACKAGES += \
    vulkan.$(TARGET_BOARD_PLATFORM) \
    libvulkan_intel

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.vulkan=$(TARGET_BOARD_PLATFORM)
##############################################################
# Source: device/intel/mixins/groups/storage/sdcard-mmc0-v-usb-sd-r/product.mk
##############################################################
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)
##############################################################
# Source: device/intel/mixins/groups/ethernet/dhcp/product.mk
##############################################################
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.ethernet.xml:vendor/etc/permissions/android.hardware.ethernet.xml
##############################################################
# Source: device/intel/mixins/groups/camera-ext/ext-camera-only/product.mk
##############################################################
# Camera: Device-specific configuration files. Supports only External USB camera, no CSI support
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.external.xml:vendor/etc/permissions/android.hardware.camera.external.xml \
    $(LOCAL_PATH)/extra_files/camera-ext/external_camera_config.xml:vendor/etc/external_camera_config.xml

# External camera service
PRODUCT_PACKAGES += android.hardware.camera.provider@2.4-external-service \
                    android.hardware.camera.provider@2.4-impl

# Only include test apps in eng or userdebug builds.
PRODUCT_PACKAGES_DEBUG += TestingCamera

PRODUCT_PACKAGES += MultiCameraApp
##############################################################
# Source: device/intel/mixins/groups/rfkill/true/product.mk
##############################################################
PRODUCT_COPY_FILES += $(INTEL_PATH_COMMON)/rfkill/rfkill-init.sh:vendor/bin/rfkill-init.sh
##############################################################
# Source: device/intel/mixins/groups/codecs/configurable/product.mk
##############################################################
# Audio/video codec support.
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:vendor/etc/media_codecs_google_audio.xml \
    $(LOCAL_PATH)/extra_files/codecs/media_profiles_1080p.xml:vendor/etc/media_profiles_V1_0.xml

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:vendor/etc/media_codecs_google_video.xml

ifeq ($(BASE_YOCTO_KERNEL),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/extra_files/codecs/media_codecs_vp9.xml:vendor/etc/media_codecs.xml \
    $(LOCAL_PATH)/extra_files/codecs/mfx_omxil_core_vp9.conf:vendor/etc/mfx_omxil_core.conf
else
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/extra_files/codecs/media_codecs_gen9.xml:vendor/etc/media_codecs.xml \
    $(LOCAL_PATH)/extra_files/codecs/media_codecs_gen9.xml:vendor/etc/media_codecs_gen9.xml \
    $(LOCAL_PATH)/extra_files/codecs/media_codecs_gen12.xml:vendor/etc/media_codecs_gen12.xml \
    $(LOCAL_PATH)/extra_files/codecs/mfx_omxil_core.conf:vendor/etc/mfx_omxil_core.conf
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/extra_files/codecs/media_codecs_performance_cml.xml:vendor/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/extra_files/codecs/media_codecs_performance_cml.xml:vendor/etc/media_codecs_performance_cml.xml \
    $(LOCAL_PATH)/extra_files/codecs/media_codecs_performance_tgl.xml:vendor/etc/media_codecs_performance_tgl.xml
##############################################################
# Source: device/intel/mixins/groups/usb/host+acc/product.mk
##############################################################
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:vendor/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:vendor/etc/permissions/android.hardware.usb.host.xml

# usb accessory
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

##############################################################
# Source: device/intel/mixins/groups/midi/true/product.mk
##############################################################
# MIDI support
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.midi.xml:vendor/etc/permissions/android.software.midi.xml
##############################################################
# Source: device/intel/mixins/groups/touch/cvt0f21/product.mk
##############################################################
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:vendor/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml\
        $(INTEL_PATH_COMMON)/touch/Vendor_1ff7_Product_0f21.idc:system/usr/idc/Vendor_1ff7_Product_0f21.idc\
        $(INTEL_PATH_COMMON)/touch/Vendor_2386_Product_3115.idc:system/usr/idc/Vendor_2386_Product_3115.idc\
        $(INTEL_PATH_COMMON)/touch/Vendor_056a_Product_489c.idc:system/usr/idc/Vendor_056a_Product_489c.idc
##############################################################
# Source: device/intel/mixins/groups/debug-tools/true/product.mk
##############################################################
PRODUCT_PACKAGES_DEBUG += \
    AndroidTerm \
    libjackpal-androidterm4 \
    peeknpoke \
    pytimechart-record \
    lspci \
    llvm-symbolizer
##############################################################
# Source: device/intel/mixins/groups/fota/true/product.mk
##############################################################
# Enable FOTA for non user builds
PRODUCT_PACKAGES_DEBUG += AFotaApp

ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.vendor.fota.ota_stream=disabled

AFOTAAPP_EULA_PATH := 
AFOTAAPP_LOG_LEVEL := DEBUG
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_SEPOLICY)/fota
endif
##############################################################
# Source: device/intel/mixins/groups/default-drm/true/product.mk
##############################################################
#only enable default drm service
PRODUCT_PACKAGES += android.hardware.drm@1.3-service.clearkey

##############################################################
# Source: device/intel/mixins/groups/thermal/thermal-daemon/product.mk
##############################################################
# thermal-daemon
PRODUCT_PACKAGES += thermal-daemon
PRODUCT_COPY_FILES += \
	$(INTEL_PATH_COMMON)/thermal/thermal-daemon/thermal-conf.xml:/vendor/etc/thermal-daemon/thermal-conf.xml \
	$(INTEL_PATH_COMMON)/thermal/thermal-daemon/thermal-cpu-cdev-order.xml:/vendor/etc/thermal-daemon/thermal-cpu-cdev-order.xml

# Thermal Hal
PRODUCT_PACKAGES += android.hardware.thermal@2.0-service.intel
##############################################################
# Source: device/intel/mixins/groups/debug-crashlogd/true/product.mk
##############################################################
ifneq ($(TARGET_BUILD_VARIANT),user)
MIXIN_DEBUG_LOGS := true
endif

ifeq ($(MIXIN_DEBUG_LOGS),true)
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/extra_files/debug-crashlogd/init.crashlogd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.crashlogd.rc \
	$(call add-to-product-copy-files-if-exists,$(LOCAL_PATH)/extra_files/debug-crashlogd/crashlog.conf:$(TARGET_COPY_OUT_VENDOR)/etc/crashlog.conf)
PRODUCT_PACKAGES += crashlogd \
	dumpstate_dropbox.sh \
	elogs.sh \
	aplog.sh \
	logfs.sh

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.vendor.service.default_logfs=apklogfs
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.logd.logpersistd.size=100
endif
##############################################################
# Source: device/intel/mixins/groups/lights/true/product.mk
##############################################################
# Lights HAL
BOARD_SEPOLICY_DIRS += \
    $(INTEL_PATH_SEPOLICY)/light

PRODUCT_PACKAGES += lights.$(TARGET_BOARD_PLATFORM) \
    android.hardware.lights-service.example

##############################################################
# Source: device/intel/mixins/groups/power/true/product.mk
##############################################################
# Power HAL
PRODUCT_PACKAGES += power.$(TARGET_BOARD_PLATFORM) \
                    android.hardware.power-service.example \
                    power_hal_helper

##############################################################
# Source: device/intel/mixins/groups/debug-usb-config/true/product.mk
##############################################################
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.vendor.debug.dvc.protocol=0
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.vendor.debug.dvc.source_dev=dvcith-0-msc0
##############################################################
# Source: device/intel/mixins/groups/intel_prop/true/product.mk
##############################################################

ifeq ($(TARGET_BUILD_VARIANT),userdebug)
PRODUCT_PACKAGES += intel_prop

PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/intel_prop/intel_prop.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/intel_prop.cfg
endif
##############################################################
# Source: device/intel/mixins/groups/memtrack/true/product.mk
##############################################################
# memtrack HAL
PRODUCT_PACKAGES += \
        memtrack.$(TARGET_BOARD_PLATFORM) \
	android.hardware.memtrack@1.0-service \
	android.hardware.memtrack@1.0-impl
##############################################################
# Source: device/intel/mixins/groups/avx/auto/product.mk
##############################################################
PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/avx/checkavx.sh:vendor/bin/checkavx.sh

PRODUCT_PACKAGES += libaudioprocessing_avx2 \
		    libneuralnetworks_avx2 \
		    libRSCpuRef_avx2 \
		    libart_avx2.com.android.art.debug \
		    libart_avx2.com.android.art.release \
		    libartd_avx2.com.android.art.debug
##############################################################
# Source: device/intel/mixins/groups/health/hal/product.mk
##############################################################
PRODUCT_PACKAGES += android.hardware.health@2.1-service \
                    android.hardware.health@2.1-impl-intel
##############################################################
# Source: device/intel/mixins/groups/abota-fw/true/product.mk
##############################################################
ABOTA_BOOTARCH=project-celadon


##############################################################
# Source: device/intel/mixins/groups/usb-otg-switch/true/product.mk
##############################################################

PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/usb-otg-switch/usb_otg_switch.sh:vendor/bin/usb_otg_switch.sh
##############################################################
# Source: device/intel/mixins/groups/public-libraries/true/product.mk
##############################################################
PRODUCT_COPY_FILES += $(LOCAL_PATH)/extra_files/public-libraries/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt
##############################################################
# Source: device/intel/mixins/groups/hdcpd/true/product.mk
##############################################################
# Enable media content protection services

# HDCP Daemon
PRODUCT_PACKAGES += hdcpd
##############################################################
# Source: device/intel/mixins/groups/load_modules/true/product.mk
##############################################################
PRODUCT_PACKAGES += load_modules.sh
##############################################################
# Source: device/intel/mixins/groups/swap/zram_auto/product.mk
##############################################################
PRODUCT_COPY_FILES += $(LOCAL_PATH)/check_lowmem.sh:$(TARGET_COPY_OUT_VENDOR)/bin/check_lowmem.sh
##############################################################
# Source: device/intel/mixins/groups/art-config/true/product.mk
##############################################################
# This is needed to enable silver art optimizer.
VENDOR_ART_PATH ?= $(INTEL_PATH_VENDOR)/art-extension

PRODUCT_PACKAGES_TESTS += \
    art-run-tests \
    libarttest \
    libnativebridgetest \
    libart-gtest.com.android.art.testing
##############################################################
# Source: device/intel/mixins/groups/filesystem_config/common/product.mk
##############################################################
PRODUCT_PACKAGES += \
	fs_config_files \
	fs_config_dirs

##############################################################
# Source: device/intel/mixins/groups/dbc/true/product.mk
##############################################################
# set default DBC configuration
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.sys.usb.adbover=dwc
##############################################################
# Source: device/intel/mixins/groups/atrace/true/product.mk
##############################################################
PRODUCT_PACKAGES += \
    android.hardware.atrace@1.0-service
##############################################################
# Source: device/intel/mixins/groups/firmware/true/product.mk
##############################################################
FIRMWARES_DIR ?= vendor/linux/firmware

$(call inherit-product,device/intel/common/firmware.mk)
##############################################################
# Source: device/intel/mixins/groups/aaf/cfc/product.mk
##############################################################
PRODUCT_PACKAGES += \
    auto_detection.sh
##############################################################
# Source: device/intel/mixins/groups/sensors/mediation/product.mk
##############################################################
ifeq ($(TARGET_BOARD_PLATFORM),)
    $(error Please define TARGET_BOARD_PLATFORM in product-level Makefile)
endif

# Sensors HAL modules
PRODUCT_PACKAGES += \
        sensors.$(TARGET_BOARD_PLATFORM)

PRODUCT_PACKAGES += \
        android.hardware.sensors@1.0-service \
        android.hardware.sensors@1.0-impl

PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.sensor.ambient_temperature.xml:vendor/etc/permissions/android.hardware.sensor.ambient_temperature.xml \
        frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:vendor/etc/permissions/android.hardware.sensor.accelerometer.xml \
        frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:vendor/etc/permissions/android.hardware.sensor.gyroscope.xml \
        frameworks/native/data/etc/android.hardware.sensor.compass.xml:vendor/etc/permissions/android.hardware.sensor.compass.xml \
        frameworks/native/data/etc/android.hardware.sensor.light.xml:vendor/etc/permissions/android.hardware.sensor.light.xml

AUTO_IN += $(TARGET_DEVICE_DIR)/extra_files/sensors/auto_hal.in
##############################################################
# Source: device/intel/mixins/groups/mainline-mod/true/product.mk
##############################################################
# Enable updating of APEXes
 $(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Enable userspace reboot
 $(call inherit-product, $(SRC_TARGET_DIR)/product/userspace_reboot.mk)

##############################################################
# Source: device/intel/mixins/groups/houdini/true/product.mk
##############################################################
# Houdini support
TARGET_SUPPORTS_64_BIT_APPS := true

PRODUCT_PACKAGES += libhoudini Houdini
PRODUCT_PROPERTY_OVERRIDES += ro.dalvik.vm.isa.arm=x86 ro.enable.native.bridge.exec=1

ENABLE_NATIVEBRIDGE_64BIT := false
ifeq ($(BOARD_USE_64BIT_USERSPACE),true)
  ENABLE_NATIVEBRIDGE_64BIT = true
else
  ifeq ($(TARGET_SUPPORTS_64_BIT_APPS),true)
    ENABLE_NATIVEBRIDGE_64BIT = true
  endif
endif
ifeq ($(ENABLE_NATIVEBRIDGE_64BIT),true)
  PRODUCT_PACKAGES += houdini64
  PRODUCT_PROPERTY_OVERRIDES += ro.dalvik.vm.isa.arm64=x86_64 ro.enable.native.bridge.exec64=1
endif
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.dalvik.vm.native.bridge=libhoudini.so
##############################################################
# Source: device/intel/mixins/groups/debug-unresponsive/default/product.mk
##############################################################
ifneq ($(TARGET_BUILD_VARIANT),user)

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += vendor.sys.dropbox.max_size_kb=4096

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += vendor.sys.dump.binder_stats.uiwdt=1
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += vendor.sys.dump.binder_stats.anr=1

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += vendor.sys.dump.peer_depth=3

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += vendor.sys.dump.stacks_timeout=1500

endif
# ------------------ END MIX-IN DEFINITIONS ------------------
