@echo off
rem  Vivado(TM)
rem  compile.bat: a Vivado-generated XSim simulation Script
rem  Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.

set PATH=%XILINX%\lib\%PLATFORM%;%XILINX%\bin\%PLATFORM%;D:/Vivado/SDK/2014.2/bin;D:/Vivado/Vivado/2014.2/ids_lite/ISE/bin/nt64;D:/Vivado/Vivado/2014.2/ids_lite/ISE/lib/nt64;D:/Vivado/Vivado/2014.2/bin;%PATH%
set XILINX_PLANAHEAD=D:/Vivado/Vivado/2014.2

xelab -m64 --debug typical --relax -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot MultiCPU_SIM_behav --prj F:/VivadoWork/MultiCPU/MultiCPU.sim/sim_1/behav/MultiCPU_SIM.prj   xil_defaultlib.MultiCPU_SIM   xil_defaultlib.glbl
if errorlevel 1 (
   cmd /c exit /b %errorlevel%
)
