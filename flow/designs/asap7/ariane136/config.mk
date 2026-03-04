export DESIGN_NAME = ariane
export DESIGN_NICKNAME = ariane136
export PLATFORM    = asap7

export SYNTH_HIERARCHICAL = 1

export VERILOG_FILES = $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/ariane.sv2v.v \
                       $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/macros.v

export SDC_FILE      = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

export ADDITIONAL_LEFS = $(PLATFORM_DIR)/lef/fakeram_256x64.lef

export ADDITIONAL_LIBS = $(LIB_DIR)/fakeram_256x64.lib

export DIE_AREA    = 0 0 1500 1500
export CORE_AREA   = 10 12 1448 1448

export IO_CONSTRAINTS = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/io.tcl

export MACRO_PLACE_HALO = 10 10

export TNS_END_PERCENT = 100
export PLACE_DENSITY = 0.35
