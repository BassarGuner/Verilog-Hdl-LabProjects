# Clock signal
set_property -dict { PACKAGE_PIN W5   IOSTANDARD LVCMOS33 } [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

# Switches
set_property -dict { PACKAGE_PIN R2    IOSTANDARD LVCMOS33 } [get_ports {upDown}]


# 7 Segment Display
# Expected sevenSegment order {a,b,c,d,e,f,g,dp}
set_property -dict { PACKAGE_PIN W7   IOSTANDARD LVCMOS33 } [get_ports {sevenSegment[7]}] 
set_property -dict { PACKAGE_PIN W6   IOSTANDARD LVCMOS33 } [get_ports {sevenSegment[6]}] 
set_property -dict { PACKAGE_PIN U8   IOSTANDARD LVCMOS33 } [get_ports {sevenSegment[5]}]
set_property -dict { PACKAGE_PIN V8   IOSTANDARD LVCMOS33 } [get_ports {sevenSegment[4]}] 
set_property -dict { PACKAGE_PIN U5   IOSTANDARD LVCMOS33 } [get_ports {sevenSegment[3]}] 
set_property -dict { PACKAGE_PIN V5   IOSTANDARD LVCMOS33 } [get_ports {sevenSegment[2]}] 
set_property -dict { PACKAGE_PIN U7   IOSTANDARD LVCMOS33 } [get_ports {sevenSegment[1]}] 
set_property -dict { PACKAGE_PIN V7   IOSTANDARD LVCMOS33 } [get_ports sevenSegment[0]]   

set_property -dict { PACKAGE_PIN U2   IOSTANDARD LVCMOS33 } [get_ports {anode[0]}]
set_property -dict { PACKAGE_PIN U4   IOSTANDARD LVCMOS33 } [get_ports {anode[1]}]
set_property -dict { PACKAGE_PIN V4   IOSTANDARD LVCMOS33 } [get_ports {anode[2]}]
set_property -dict { PACKAGE_PIN W4   IOSTANDARD LVCMOS33 } [get_ports {anode[3]}]


#Buttons
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports rst]