export DESIGN_NICKNAME = bp
export DESIGN_NAME = black_parrot
export PLATFORM    = asap7

export SYNTH_HIERARCHICAL = 1
#

export VERILOG_FILES = $(DESIGN_HOME)/src/$(DESIGN_NAME)/pickled.v \
                       $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NAME)/macros.v

export ABC_AREA = 1

export SDC_FILE      = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NAME)/constraint.sdc

export ADDITIONAL_LEFS = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NAME)/fakeram7_256x256.lef \
                         $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NAME)/fakeram7_256x32.lef \
                         $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NAME)/fakeram7_64x28.lef \
                         $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NAME)/fakeram7_64x256.lef

export ADDITIONAL_LIBS = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NAME)/fakeram7_256x256.lib \
                         $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NAME)/fakeram7_256x32.lib \
                         $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NAME)/fakeram7_64x28.lib \
                         $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NAME)/fakeram7_64x256.lib 


export DIE_AREA    = 0 0 1350 1300 
export CORE_AREA   = 10.07 11.2 1340 1290 

export IO_CONSTRAINTS = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NAME)/io.tcl

export PLACE_DENSITY_LB_ADDON = 0.05

# export MACRO_PLACEMENT_TCL = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NAME)/macro_placement.tcl

export MACRO_PLACE_HALO    = 10 10

export TNS_END_PERCENT     = 100

export HOLD_SLACK_MARGIN = 0.03
