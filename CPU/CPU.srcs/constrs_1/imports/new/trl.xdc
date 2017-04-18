# Nexys4 Pin Assignments
############################
# On-board Slide Switches & trl #
############################

#[Place 30-574] Poor placement for routing between an IO pin and BUFG. If this sub optimal condition is acceptable for this design, you may use the CLOCK_DEDICATED_ROUTE constraint in the .xdc file to demote this message to a WARNING. However, the use of this override is highly discouraged. These examples can be used directly in the .xdc file to override this clock rule.
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clr] 

#	r_IBUF[1]_inst (IBUF.O) is locked to IOB_X1Y58
#	 and r_IBUF_BUFG[1]_inst (BUFG.I) is provisionally placed by clockplacer on BUFGCTRL_X0Y2
set_property SEVERITY {Warning} [get_drc_checks NSTD-1]
set_property SEVERITY {Warning} [get_drc_checks UCIO-1]

set_property PACKAGE_PIN E3 [get_ports e3]
set_property IOSTANDARD LVCMOS33 [get_ports e3]

set_property PACKAGE_PIN U9 [get_ports clr]
set_property IOSTANDARD LVCMOS33 [get_ports clr]

set_property PACKAGE_PIN U8 [get_ports timeup]
set_property IOSTANDARD LVCMOS33 [get_ports timeup]

set_property PACKAGE_PIN R7 [get_ports J_num]
set_property IOSTANDARD LVCMOS33 [get_ports J_num]

set_property PACKAGE_PIN R6 [get_ports load_use_num]
set_property IOSTANDARD LVCMOS33 [get_ports load_use_num]

set_property PACKAGE_PIN R5 [get_ports all_num]
set_property IOSTANDARD LVCMOS33 [get_ports all_num]
############################
# On-board display             #
############################


set_property PACKAGE_PIN M1 [get_ports Lc[7]]
set_property IOSTANDARD LVCMOS33 [get_ports Lc[7]]
set_property PACKAGE_PIN L1 [get_ports Lc[6]]
set_property IOSTANDARD LVCMOS33 [get_ports Lc[6]]
set_property PACKAGE_PIN N4 [get_ports Lc[5]]
set_property IOSTANDARD LVCMOS33 [get_ports Lc[5]]
set_property PACKAGE_PIN N2 [get_ports Lc[4]]
set_property IOSTANDARD LVCMOS33 [get_ports Lc[4]]
set_property PACKAGE_PIN N5 [get_ports Lc[3]]
set_property IOSTANDARD LVCMOS33 [get_ports Lc[3]]
set_property PACKAGE_PIN M3 [get_ports Lc[2]]
set_property IOSTANDARD LVCMOS33 [get_ports Lc[2]]
set_property PACKAGE_PIN M6 [get_ports Lc[1]]
set_property IOSTANDARD LVCMOS33 [get_ports Lc[1]]
set_property PACKAGE_PIN N6 [get_ports Lc[0]]
set_property IOSTANDARD LVCMOS33 [get_ports Lc[0]]

set_property PACKAGE_PIN L6 [get_ports AtoP[6]]
set_property IOSTANDARD LVCMOS33 [get_ports AtoP[6]]
set_property PACKAGE_PIN M2 [get_ports AtoP[5]]
set_property IOSTANDARD LVCMOS33 [get_ports AtoP[5]]
set_property PACKAGE_PIN K3 [get_ports AtoP[4]]
set_property IOSTANDARD LVCMOS33 [get_ports AtoP[4]]
set_property PACKAGE_PIN L4 [get_ports AtoP[3]]
set_property IOSTANDARD LVCMOS33 [get_ports AtoP[3]]
set_property PACKAGE_PIN L5 [get_ports AtoP[2]]
set_property IOSTANDARD LVCMOS33 [get_ports AtoP[2]]
set_property PACKAGE_PIN N1 [get_ports AtoP[1]]
set_property IOSTANDARD LVCMOS33 [get_ports AtoP[1]]
set_property PACKAGE_PIN L3 [get_ports AtoP[0]]
set_property IOSTANDARD LVCMOS33 [get_ports AtoP[0]]