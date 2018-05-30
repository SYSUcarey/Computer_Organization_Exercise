`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/24 13:12:50
// Design Name: 
// Module Name: Show
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


module Show(
    input CLK1,     //按键时钟信号
    input CLK2,     //Basys3板时钟信号
    input [1:0]SW_In,
    input Reset,
    output [3:0]AN,
    output [7:0]dispcode
    );
    
    wire CLK;   //CPU工作信号,经过防抖处理得到
    DebKey deb(CLK2, CLK1, CLK);
    
    //add CPU input wire signal
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
    
    SingleCPU(CLK,Reset,PCWre,Addr,NextPC,PC4,Instruction,opcode,zero,InsMemRW,RegDst,
				RegWre,ALUOp,PCSrc,ALUSrcA,ALUSrcB,mRD,mWR,DBDataSrc,ExtSel,rt, rd,ReadReg1,ReadReg2,
                WriteReg,WriteData,ReadData1,ReadData2,ExtendNum,sa,NumA,NumB,ALUResult,DataOut,Imm,PCAddImm);
    
    wire CLK3;      //分频后的时钟信号，用于计数器
    clock_div div(CLK2, CLK3);
    
    wire [1:0]count;    //计数器输出
    counter4 counter(CLK3, count);
    
    reg [31:0]DataIn1, DataIn2;
    always @(SW_In) begin
        case (SW_In)
            2'b00:begin
                DataIn1 = Addr;
                DataIn2 = NextPC;
                end
            2'b01:begin
                DataIn1[31:5] = 0;
                DataIn1[4:0] = ReadReg1;
                DataIn2 = ReadData1;
                end
            2'b10:begin
                DataIn1[31:5] = 0;
                DataIn1[4:0] = rt;
                DataIn2 = ReadData2;
                end
            2'b11:begin
                DataIn1 = ALUResult;
                DataIn2 = WriteData;
                end
        endcase
    end
    wire [3:0]display_data;
    Display_seg display(CLK2, count, DataIn1, DataIn2, AN, display_data);
    
    SegLED seg(display_data, dispcode);
endmodule
