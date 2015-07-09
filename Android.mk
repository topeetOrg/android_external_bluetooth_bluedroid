LOCAL_PATH := $(call my-dir)

# Setup bdroid local make variables for handling configuration
ifneq ($(BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR),)
  bdroid_C_INCLUDES := $(BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR)
  bdroid_CFLAGS := -DHAS_BDROID_BUILDCFG
else
  bdroid_C_INCLUDES :=
  bdroid_CFLAGS := -DHAS_NO_BDROID_BUILDCFG
endif

ifeq ($(strip $(BOARD_CONNECTIVITY_VENDOR)), MediaTek)
#For MT66xx Combo Chip
ifeq ($(strip $(BOARD_CONNECTIVITY_MODULE)), combo_mt66xx)
    bdroid_CFLAGS += -DHCILP_INCLUDED=0
    bdroid_CFLAGS += -DPRELOAD_START_TIMEOUT_MS=20000
endif
#For MT6622 + MT5931 chipset 
ifeq ($(strip $(BOARD_CONNECTIVITY_MODULE)), mt5931_6622)
    bdroid_CFLAGS += -DPRELOAD_START_TIMEOUT_MS=10000
    bdroid_CFLAGS += -DMTK_MT6622
endif

#For MT6622 
ifeq ($(strip $(BOARD_CONNECTIVITY_MODULE)), mt6622)
    bdroid_CFLAGS += -DPRELOAD_START_TIMEOUT_MS=10000
    bdroid_CFLAGS += -DMTK_MT6622
endif

endif

include $(call all-subdir-makefiles)

# Cleanup our locals
bdroid_C_INCLUDES :=
bdroid_CFLaGS :=
