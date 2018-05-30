`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/22 16:26:32
// Design Name: 
// Module Name: SingleCPU_SIM
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


module SingleCPU_SIM();
    //PC
    reg CLK;
    reg Reset;
    wire PCWre;
    wire [31:0] Addr;
    wire [31:0] NextPC;
    //PCAddFour
    wire [31:0] PC4;
    //ROM
    wire [31:0] Instruction;   
    //ControlUnit      
    wire [5:0]opcode;             //opcode = Instruction[31:26] 
    wire zero;
    wire InsMemRW;
    wire RegDst;
    wire RegWre;
    wire [2:0] ALUOp;
    wire [1:0] PCSrc;
    wire ALUSrcA;
    wire ALUSrcB;
    wire mRD;
    wire mWR;
    wire DBDataSrc;
    wire ExtSel;
    //DataSelect_5_bit
    wire [4:0] rt;
    wire [4:0] rd;
    //RegisterFile
    wire [4:0] ReadReg1;
    wire [4:0] ReadReg2;
    wire [4:0] WriteReg;
    wire [31:0] WriteData;
    wire [31:0] ReadData1;
    wire [31:0] ReadData2;
    //Extend
    wire [31:0] ExtendNum;
    //DataSelectForALU
    wire [4:0] sa;
    wire [31:0] NumA;
    wire [31:0] NumB;
    //ALU
    wire [31:0] ALUResult;
    //DataMemory
    wire [31:0] DataOut;
    
    //DataSelect_32_bit 无新信号量
    //PCAddImm
    wire [25:0] Imm;
    wire [31:0] PCAddImm;
    
    SingleCPU uut (
            .CLK(CLK),
            .Reset(Reset),
            .PCWre(PCWre),
            .Addr(Addr),
            .NextPC(NextPC),
            .PC4(PC4),
            .Instruction(Instruction),
			.opcode(opcode),
			.zero(zero),
			.InsMemRW(InsMemRW),
			.RegDst(RegDst),
			.RegWre(RegWre),
			.ALUOp(ALUOp),
			.PCSrc(PCSrc),
			.ALUSrcA(ALUSrcA),
			.ALUSrcB(ALUSrcB),
			.mRD(mRD),
			.mWR(mWR),
			.DBDataSrc(DBDataSrc),
			.ExtSel(ExtSel),
			.rt(rt),
			.rd(rd),
			.ReadReg1(ReadReg1),
			.ReadReg2(ReadReg2),
			.WriteReg(WriteReg),
			.WriteData(WriteData),
			.ReadData1(ReadData1),
			.ReadData2(ReadData2),
			.ExtendNum(ExtendNum),
			.sa(sa),
			.NumA(NumA),
			.NumB(NumB),
			.ALUResult(ALUResult),
			.DataOut(DataOut),
			.Imm(Imm),
			.PCAddImm(PCAddImm)
    );
    
    always #50 CLK = !CLK;
    
        initial begin
            //Initialize Inputs
            CLK = 0;
            Reset = 0;
        
        #150; 
            Reset = 1;
        end
endmodule
