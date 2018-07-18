#!/bin/sh
# Vivado(TM)
# compile.sh: Vivado-generated Script for launching XSim application
# Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
# 
if [ -z "$PATH" ]; then
  PATH=%XILINX%\lib\%PLATFORM%;%XILINX%\bin\%PLATFORM%:D:/Vivado/SDK/2014.2/bin;D:/Vivado/Vivado/2014.2/ids_lite/ISE/bin/nt64;D:/Vivado/Vivado/2014.2/ids_lite/ISE/lib/nt64
else
  PATH=%XILINX%\lib\%PLATFORM%;%XILINX%\bin\%PLATFORM%:D:/Vivado/SDK/2014.2/bin;D:/Vivado/Vivado/2014.2/ids_lite/ISE/bin/nt64;D:/Vivado/Vivado/2014.2/ids_lite/ISE/lib/nt64:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=:
else
  LD_LIBRARY_PATH=::$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

#
# Setup env for Xilinx simulation libraries
#
XILINX_PLANAHEAD=D:/Vivado/Vivado/2014.2
export XILINX_PLANAHEAD
ExecStep()
{
   "$@"
   RETVAL=$?
   if [ $RETVAL -ne 0 ]
   then
       exit $RETVAL
   fi
}

ExecStep xelab -m64 --debug typical --relax -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot MultiCPU_SIM_behav --prj F:/VivadoWork/MultiCPU/MultiCPU.sim/sim_1/behav/MultiCPU_SIM.prj   xil_defaultlib.MultiCPU_SIM   xil_defaultlib.glbl
