set DESIGN "Tradeoff_16bits"

#---------------------------------------
# read_file -format verilog "./design.v"
#--------------------------------------
##### Above all are not available for "parameter" to transport
##### Below use two method to hamdle:
######## Method 1: in ./design_data 
file mkdir ./work
define_design_lib WORK -path ./work
analyze -format verilog $DESIGN\.v
elaborate $DESIGN
### read_saif -input file.saif -instance_name testbench module/instance name
### read_saif -input pe_array.saif -instance_name pe_array_tb/pe_array33

#-----------------------------------
current_design [get_designs $DESIGN]
source .synopsys_dc.setup
link
#-----------------------------------
set_operating_conditions -min_library fsa0m_a_generic_core_ff1p98vm40c -min BCCOM  -max_library fsa0m_a_generic_core_ss1p62v125c -max WCCOM
# set_drive  0.1  [all_inputs]
# set_load   40	  [all_outputs]
set_driving_cell -library fsa0m_a_t33_generic_io_ss1p62v125c -lib_cell XMC -pin {O} [all_inputs]
set_load [load_of "fsa0m_a_t33_generic_io_ss1p62v125c/YA2GSC/I"] [all_outputs]
#-------------------------------------------------------
## Below is for combinational circuit
# set_max_delay 100 -from [all_inputs] -to [all_outputs]
#--------------------------------------------------------
# define clock period
create_clock -period 40 [get_ports clk]  -waveform {0 20}
### set power_default_toggle_rate 0.5 (default)
### set power_default_static_probability 0.5 (default)
#####################################################
set_dont_touch_network  [get_clocks clk]
set_fix_hold  [get_clocks clk]
set_clock_uncertainty  0.3  [get_clocks clk]
set_clock_latency  1  [get_clocks clk]
set_ideal_network  [get_ports clk]
set_ideal_network  [get_ports rst_n]
set_clock_transition  0.1  [all_clocks]
set_input_transition  0.5  [all_inputs]
set_max_fanout 6 [all_inputs]
set high_fanout_net_threshold 0
uniquify
set_fix_multiple_port_nets -all -buffer_constants [get_designs *]
## set_dont_touch [get_cell ipad_*]
## set_dont_touch [get_cell opad_*]
check_timing
set_max_area 0
set_max_capacitance 0.5 [all_inputs]
set_max_transition 0.5 [all_inputs]
check_timing
current_design [get_designs $DESIGN]
### compile -exact_map
### compile -exact_map -map_effort high -area_effort high -power_effort high
compile -boundary_optimization 
current_design [get_designs $DESIGN]
#remove_unconnected_ports -blast_buses [get_cells -hierarchical *]
set bus_inference_style {%s[%d]}
set bus_naming_style {%s[%d]}
set hdlout_internal_busses true
change_names -hierarchy -rule verilog
define_name_rules name_rule -allowed {a-z A-Z 0-9 _} -max_length 255 -type cell
define_name_rules name_rule -allowed {a-z A-Z 0-9 _[]} -max_length 255 -type net
define_name_rules name_rule -map {{"\\*cell\\*" "cell"}}
define_name_rules name_rule -case_insensitive
change_names -hierarchy -rules name_rule
write -format verilog -hierarchy -output $DESIGN\_syn.v
write -format ddc   -hierarchy -output $DESIGN\_syn.ddc
write_sdc -version 2.0 $DESIGN\_syn.sdc
write_sdf -version 2.0 -context verilog -load_delay net $DESIGN\_syn.sdf
report_area > $DESIGN\_area.log
report_area -hierarchy > $DESIGN\_area-hierarchy.log
report_timing > $DESIGN\_timing.log
report_power > $DESIGN\_power.log
report_qor   >  $DESIGN\_syn.qor
