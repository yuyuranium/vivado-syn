TOP := mkStack8x16
VIVADO := vivado -mode batch

PROJ_ROOT := $(abspath .)
RTL_DIR := $(PROJ_ROOT)/rtl
INC_DIR := $(PROJ_ROOT)/inc
BUILD_DIR := $(PROJ_ROOT)/build
SCRIPT_DIR := $(PROJ_ROOT)/scripts
IMPL_SCRIPT := $(SCRIPT_DIR)/impl.tcl
PROG_SCRIPT := $(SCRIPT_DIR)/program.tcl
RTL_SOURCES := $(wildcard $(RTL_DIR)/*.sv)
SV_HEADERS := $(wildcard $(INC_DIR)/*.svh)

.PHONY: all impl program clean

all: impl

impl:	$(BUILD_DIR)/$(TOP).bit

$(BUILD_DIR)/$(TOP).bit: $(IMPL_SCRIPT) $(RTL_SOURCES) $(SV_HEADERS)
	mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR) && $(VIVADO) -source $(IMPL_SCRIPT)

program: $(PROG_SCRIPT)
	cd $(BUILD_DIR) && $(VIVADO) -source $(PROG_SCRIPT)

clean:
	rm -rf $(BUILD_DIR)
