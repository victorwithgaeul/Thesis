######################################
# Set your desired file names
######################################
rtl_file="rtl_file.f"		# Name of your source file
gate_file="gate_file.f"
output_file="simv"      	# Desired output simulation file name
log_file="vcs.log"      	# Desired log file name


######################################
# Default Setting
######################################
TIMESCALE=-timescale=10ns/1ps
DW_SIM=/usr/cad/synopsys/synthesis/cur/dw/sim_ver/
VERDI=/usr/cad/synopsys/verdi/2023.12/
UMC018_SIM=/usr/cad/Library/CBDK018_UMC_Faraday_v1.0/CIC/Verilog/fsa0m_a_generic_core_21.lib.src
UMC018_IO_SIM=/Library/CBDK018_UMC_Faraday_v1.0/CIC/Verilog/fsa0m_a_t33_generic_io_21.lib.src

# =====================================
# ============== VCS ==================
# =====================================
rtl_sim: rtl_vcs
gate_sim: gate_vcs

rtl_vcs:
	vcs ${TIMESCALE} \
	-debug_acc -R -full64 +v2k \
	-y ${DW_SIM} \
	+libext+.v \
	-f ${rtl_file} -l ${log_file} -o ${output_file} \
	-P ${VERDI}/share/PLI/VCS/linux64/novas.tab \
      	   ${VERDI}/share/PLI/VCS/linux64/pli.a \
    	+notimingchecks 

gate_vcs:
	vcs -debug_acc -R -full64 +v2k \
	-f ${gate_file} -l ${log_file} -o ${output_file} \
	-P ${VERDI}/share/PLI/VCS/linux64/novas.tab \
      	   ${VERDI}/share/PLI/VCS/linux64/pli.a \
	    -v ${UMC018_SIM} \
    	+neg_tchk 

# =====================================
# ============= verdi =================
# =====================================

rtl_verdi: rtl_verdi
gate_verdi: gate_verdi

rtl_verdi:
	verdi -f ${rtl_file} -ssf *.fsdb
	

gate_verdi:
	verdi -f ${gate_file} -ssf *.fsdb
		


# =====================================	
# ============= clean =================
# =====================================
clean:
	rm -rf *vpd *rc verdi* novas* unrSimv* simv* csrc* *.log *key *fsdb *Log *bak *el *report no_trace* vhdl* partition* dprof* clk* *DB *dir work *lib write_fifo* urg* race* simprofile* profile*
