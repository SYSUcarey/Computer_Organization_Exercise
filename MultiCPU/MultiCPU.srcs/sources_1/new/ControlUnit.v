`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/24 21:17:41
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(Opcode,sign,zero,RST,CLK,PCWre,IRWre,InsMemRW,WrRegDSrc,RegDst,RegWre,ALUOp,PCSrc,ALUSrcA,ALUSrcB,RD,WR,DBDataSrc,ExtSel);
    input [5:0] Opcode;
    input sign,zero,RST,CLK;
    output wire PCWre,IRWre,InsMemRW,WrRegDSrc,RegWre,ALUSrcA,ALUSrcB,RD,WR,DBDataSrc,ExtSel;
    output wire [1:0] PCSrc,RegDst;
    output wire [2:0] ALUOp;
    
    wire [2:0] inputState,outputState;
    
    DFlipFlop myDFlipFlop(inputState,RST,CLK,outputState);
    NextState myNextState(outputState,Opcode,inputState);
    OutputFunction myOutputFunction(outputState,Opcode,zero,sign,PCWre,IRWre,InsMemRW,WrRegDSrc,RegDst,RegWre,ALUOp,PCSrc,ALUSrcA,ALUSrcB,RD,WR,DBDataSrc,ExtSel);
endmodule
