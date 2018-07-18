# 
# Synthesis run script generated by Vivado
# 

  set_param gui.test TreeTableDev
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1
set_property target_language Verilog [current_project]
set_param project.compositeFile.enableAutoGeneration 0
set_property default_lib xil_defaultlib [current_project]
read_verilog -library xil_defaultlib {
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/new/OutputFunction.v
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/new/NextState.v
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/new/DFlipFlop.v
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/new/WriteRegMux.v
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/new/WriteDataMux.v
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/new/RegisterFile.v
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/new/PCAddImm.v
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/new/PCAddFour.v
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/new/PC.v
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/new/NextPCSelect.v
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/new/IR.v
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/new/InstructionMemory.v
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/new/Extend.v
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/new/DBMux.v
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/new/DBDR.v
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/new/DataMemory.v
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/new/ControlUnit.v
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/new/BDR.v
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/new/ALUoutDR.v
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/new/ALUMux.v
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/new/ALU.v
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/new/ADR.v
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/new/MultiCPU.v
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/imports/new/SegLED.v
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/imports/new/Display_seg.v
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/imports/new/DebKey.v
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/imports/new/counter4.v
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/imports/new/clock_div.v
  F:/VivadoWork/MultiCPU/MultiCPU.srcs/sources_1/imports/new/Show.v
}
read_xdc F:/VivadoWork/MultiCPU/MultiCPU.srcs/constrs_1/new/MultiCPU.xdc
set_property used_in_implementation false [get_files F:/VivadoWork/MultiCPU/MultiCPU.srcs/constrs_1/new/MultiCPU.xdc]

set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir F:/VivadoWork/MultiCPU/MultiCPU.cache/wt [current_project]
set_property parent.project_dir F:/VivadoWork/MultiCPU [current_project]
catch { write_hwdef -file Show.hwdef }
synth_design -top Show -part xc7a35tcpg236-1
write_checkpoint Show.dcp
report_utilization -file Show_utilization_synth.rpt -pb Show_utilization_synth.pb
