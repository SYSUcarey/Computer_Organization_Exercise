`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/25 01:42:18
// Design Name: 
// Module Name: MultiCPU
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


module MultiCPU(CLK,RST,nowPC,nextPC,rs,rt,ReadData1,ReadData2,ALUResult,DB);
    input CLK,RST;
    output [31:0] nowPC,nextPC;
    output [4:0] rs,rt;
    output [31:0]ReadData1,ReadData2;
    output [31:0]ALUResult,DB;
    
    parameter reg31 = 5'b11111;
        
    wire [31:0] PC4, PCJump;
    wire [31:0] instruction, inputIR, outputADR, outputBDR, outputALUDR, inputDBDR;
    wire [31:0] NumA, NumB,ALUResult;
    wire [31:0] ExtendNum;
    wire [31:0] DataOut;
    wire [31:0] WriteData;
        
    wire [5:0] Opcode;
    wire [4:0] rd,sa;
    wire [25:0] Imm;
    wire [2:0] ALUOp;
    wire [1:0] PCSrc, RegDst;
    wire [4:0] WriteReg;
    wire zero, sign, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, WrRegDSrc, InsMemRW, mRD, mWR, IRWre, ExtSel;
        
    assign Opcode = instruction[31:26];
    assign rs = instruction[25:21];
    assign rt = instruction[20:16];
    assign rd = instruction[15:11];
    assign Imm = instruction[25:0];
    assign sa = instruction[10:6];
    
    //assign PC4 = nowPC + 4;
    //assign comparePC = PC4 + (extendImmediate << 2);
    //assign jumpPC[31:28] = PC4[31:28];
    //assign jumpPC[27:2] = instruction[25:0];
    //assign jumpPC[1:0] = 2'b00;
    PC myPC(CLK,PCWre,RST,nextPC,nowPC);
    PCAddFour myPCAddFour(nowPC,PC4);
    InstructionMemory myInstructionMemory(InsMemRW,nowPC,inputIR);
    IR myIR(CLK,IRWre,inputIR,instruction);
    WriteRegMux myWriteRegMux(reg31,rt,rd,RegDst,WriteReg);
    WriteDataMux myWriteDataMux(PC4,DB,WrRegDSrc,WriteData);
    RegisterFile myRegisterFile(CLK, rs, rt, WriteReg, RegWre, WriteData, ReadData1, ReadData2);
    ControlUnit myControlUnit(Opcode,sign,zero,RST,CLK,PCWre,IRWre,InsMemRW,WrRegDSrc,RegDst,RegWre,ALUOp,PCSrc,ALUSrcA,ALUSrcB,RD,WR,DBDataSrc,ExtSel);
    Extend myExtend(instruction[15:0],ExtSel,ExtendNum);
    ADR myADR(CLK,ReadData1,outputADR);
    BDR myBDR(CLK,ReadData2,outputBDR);
    ALUMux myALUMux(outputADR,sa,outputBDR,ExtendNum,ALUSrcA,ALUSrcB,NumA,NumB);
    ALU myALU(ALUOp, NumA, NumB, ALUResult, zero, sign);
    ALUoutDR myALUoutDR(CLK,ALUResult,outputALUDR);
    DataMemory myDataMemory(outputALUDR, outputBDR, RD, WR, DataOut);
    DBMux myDBMux(DBDataSrc,ALUResult,DataOut,inputDBDR);
    DBDR myDBDR(CLK,inputDBDR,DB);
    PCAddImm myPCAddImm(PC4,Imm,PCJump);
    NextPCSelect myNextPCSelect(PC4,ExtendNum,ReadData1,PCJump,PCSrc, nextPC);
    
endmodule
