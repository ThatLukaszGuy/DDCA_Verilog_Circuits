
c
Command: %s
53*	vivadotcl22
write_bitstream -force top.bit2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-349h px� 
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px� 
>
IP Catalog is up to date.1232*coregenZ19-1839h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�
�Missing CFGBVS and CONFIG_VOLTAGE Design Properties: Neither the CFGBVS nor CONFIG_VOLTAGE voltage property is set in the current_design.  Configuration bank voltage select (CFGBVS) must be set to VCCO or GND, and CONFIG_VOLTAGE must be set to the correct configuration voltage, in order to determine the I/O voltage support for the pins in bank 0.  It is suggested to specify these either using the 'Edit Device Properties' function in the GUI or directly in the XDC file using the following syntax:

 set_property CFGBVS value1 [current_design]
 #where value1 is either VCCO or GND

 set_property CONFIG_VOLTAGE value2 [current_design]
 #where value2 is the voltage provided to configuration bank 0

Refer to the device configuration user guide for more information.%s*DRC2(
 DRC|Pin Planning2default:default8ZCFGBVS-1h px� 
�
�Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2<
 "&
div/CLKdiv/CLK2default:default2default:default2j
 "T
div/FSM_onehot_state[18]_i_1/Odiv/FSM_onehot_state[18]_i_1/O2default:default2default:default2f
 "P
div/FSM_onehot_state[18]_i_1	div/FSM_onehot_state[18]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px� 
�
�Non-Optimal connections which could lead to hold violations: A LUT %s is driving clock pin of 19 cells. This could lead to large hold time violations. Involved cells are:
%s%s*DRC2f
 "P
div/FSM_onehot_state[18]_i_1	div/FSM_onehot_state[18]_i_12default:default2default:default2�
 "X
 fsm_core/FSM_onehot_state_reg[0]	 fsm_core/FSM_onehot_state_reg[0]2default:default"Z
!fsm_core/FSM_onehot_state_reg[10]	!fsm_core/FSM_onehot_state_reg[10]2default:default"Z
!fsm_core/FSM_onehot_state_reg[11]	!fsm_core/FSM_onehot_state_reg[11]2default:default"Z
!fsm_core/FSM_onehot_state_reg[12]	!fsm_core/FSM_onehot_state_reg[12]2default:default"Z
!fsm_core/FSM_onehot_state_reg[13]	!fsm_core/FSM_onehot_state_reg[13]2default:default"Z
!fsm_core/FSM_onehot_state_reg[14]	!fsm_core/FSM_onehot_state_reg[14]2default:default"Z
!fsm_core/FSM_onehot_state_reg[15]	!fsm_core/FSM_onehot_state_reg[15]2default:default"Z
!fsm_core/FSM_onehot_state_reg[16]	!fsm_core/FSM_onehot_state_reg[16]2default:default"Z
!fsm_core/FSM_onehot_state_reg[17]	!fsm_core/FSM_onehot_state_reg[17]2default:default"Z
!fsm_core/FSM_onehot_state_reg[18]	!fsm_core/FSM_onehot_state_reg[18]2default:default"X
 fsm_core/FSM_onehot_state_reg[1]	 fsm_core/FSM_onehot_state_reg[1]2default:default"X
 fsm_core/FSM_onehot_state_reg[2]	 fsm_core/FSM_onehot_state_reg[2]2default:default"X
 fsm_core/FSM_onehot_state_reg[3]	 fsm_core/FSM_onehot_state_reg[3]2default:default"X
 fsm_core/FSM_onehot_state_reg[4]	 fsm_core/FSM_onehot_state_reg[4]2default:default"T
 fsm_core/FSM_onehot_state_reg[5]	 fsm_core/FSM_onehot_state_reg[5]2default:..."/
(the first 15 of 19 listed)2default:default2default:default2A
 )DRC|Implementation|Placement|DesignChecks2default:default8ZPLHOLDVIO-2h px� 
f
DRC finished with %s
1905*	planAhead2(
0 Errors, 3 Warnings2default:defaultZ12-3199h px� 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px� 
i
)Running write_bitstream with %s threads.
1750*designutils2
22default:defaultZ20-2272h px� 
?
Loading data files...
1271*designutilsZ12-1165h px� 
>
Loading site data...
1273*designutilsZ12-1167h px� 
?
Loading route data...
1272*designutilsZ12-1166h px� 
?
Processing options...
1362*designutilsZ12-1514h px� 
<
Creating bitmap...
1249*designutilsZ12-1141h px� 
7
Creating bitstream...
7*	bitstreamZ40-7h px� 
Z
Writing bitstream %s...
11*	bitstream2
	./top.bit2default:defaultZ40-11h px� 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1122default:default2
42default:default2
02default:default2
02default:defaultZ4-41h px� 
a
%s completed successfully
29*	vivadotcl2#
write_bitstream2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
write_bitstream: 2default:default2
00:00:122default:default2
00:00:112default:default2
2030.3752default:default2
393.3952default:defaultZ17-268h px� 


End Record