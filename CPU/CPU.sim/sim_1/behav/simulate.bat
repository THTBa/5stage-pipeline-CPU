@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xsim trl_s_behav -key {Behavioral:sim_1:Functional:trl_s} -tclbatch trl_s.tcl -view F:/hd/CS1401_U201414573_÷Ï¨B/CPU/trl_s_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
