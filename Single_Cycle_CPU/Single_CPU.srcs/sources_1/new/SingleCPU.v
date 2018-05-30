`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/22 16:18:43
// Design Name: 
// Module Name: SingleCPU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SingleCPU(
    //PC
    input CLK,
    input Reset,
    output PCWre,
    output [31:0] Addr,
    output [31:0] NextPC,
    //PCAddFour
    output [31:0] PC4,
    //ROM
    output [31:0] Instruction,   
    //ControlUnit      
    output [5:0] opcode,              //opcode = Instruction[31:26] 
    output zero,
    output InsMemRW,
    output RegDst,
    output RegWre,
    output [2:0] ALUOp,
    output [1:0] PCSrc,
    output ALUSrcA,
    output ALUSrcB,
    output mRD,
    output mWR,
    output DBDataSrc,
    output ExtSel,
    //DataSelect_5_bit
    output [4:0] rt,
    output [4:0] rd,
    //RegisterFile
    output [4:0] ReadReg1,
    output [4:0] ReadReg2,
    output [4:0] WriteReg,
    output [31:0] WriteData,
    output [31:0] ReadData1,
    output [31:0] ReadData2,
    //Extend
    output [31:0] ExtendNum,
    //DataSelectForALU
    output [4:0] sa,
    output [31:0] NumA,
    output [31:0] NumB,
    //ALU
    output [31:0] ALUResult,
    //DataMemory
    output [31:0] DataOut,
    
    //DataSelect_32_bit 无新信号量
    //PCAddImm
    output [25:0] Imm,
    output [31:0] PCAddImm
);
    assign opcode = Instruction[31:26]; 
    assign ReadReg1 = Instruction[25:21];
    assign ReadReg2 = Instruction[20:16];
    assign rt = Instruction[20:16];
    assign rd = Instruction[15:11];
    assign sa = Instruction[10:6];
    assign Imm = Instruction[25:0];
    
    PC myPC(CLK,PCWre,Reset,NextPC,Addr);
    PCAddFour myPCAddFour(Addr,PC4);
    ROM myROM(InsMemRW,Addr,Instruction);
    ControlUnit myControlUnit(opcode, zero, PCWre, InsMemRW, RegDst, RegWre, ALUOp, PCSrc, ALUSrcA, ALUSrcB, mRD, mWR, DBDataSrc, ExtSel); 
    DataSelect_5_bit myDataSelect_5_bit(rt,rd,RegDst,WriteReg);
    RegisterFile myRegisterFile(CLK, ReadReg1, ReadReg2, WriteReg, RegWre, WriteData, ReadData1, ReadData2);
    Extend myExtend(Instruction[15:0],ExtSel,ExtendNum);
    DataSelectForALU myDataSelectForALU(ReadData1,sa,ReadData2,ExtendNum,ALUSrcA,ALUSrcB,NumA,NumB);
    ALU myALU(ALUOp,NumA,NumB,ALUResult,zero);
    DataMemory myDataMemory(CLK,ALUResult,ReadData2,mRD,mWR,DataOut);
    DataSelect_32_bit myDataSelect_32_bit(ALUResult,DataOut,DBDataSrc, WriteData);
    PCAddImm myPCAddImm(PC4,Imm, PCAddImm);
    NextPCSelect myNextPCSelect(PC4,ExtendNum,PCAddImm,PCSrc,NextPC);
    
endmodule
