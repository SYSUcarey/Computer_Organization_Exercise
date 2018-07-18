`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/24 18:05:01
// Design Name: 
// Module Name: PCAddImm
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

//PC加立即数模块，用于获得NextPCSelect的输入
module PCAddImm(PC4,Imm,PCOut);
    input [31:0] PC4;
    input [25:0] Imm;
    output [31:0] PCOut;
    assign PCOut = {PC4[31:28],Imm[25:0],2'b00};
endmodule
