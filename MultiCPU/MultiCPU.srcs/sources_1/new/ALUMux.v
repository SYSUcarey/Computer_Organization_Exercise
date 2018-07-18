`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/24 21:15:12
// Design Name: 
// Module Name: ALUMux
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


module ALUMux(ReadData1,sa,ReadData2,ExtendNum,ALUSrcA,ALUSrcB,NumA,NumB);
    input [31:0] ReadData1;
    input [4:0] sa;
    input [31:0] ReadData2;
    input [31:0] ExtendNum;
    input ALUSrcA;
    input ALUSrcB;
    output [31:0]NumA;
    output [31:0]NumB;
        
    //wire [31:0] Extendsa;
    //assign Extendsa = {{27{0}},sa[4:0]};
    assign NumA = (ALUSrcA==0)?ReadData1:({{27{0}},sa[4:0]});
    assign NumB = (ALUSrcB==0)?ReadData2:ExtendNum;
endmodule
