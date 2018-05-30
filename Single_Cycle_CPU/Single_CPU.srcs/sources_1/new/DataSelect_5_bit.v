`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/27 17:19:37
// Design Name: 
// Module Name: DataSelect_5_bit
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


module DataSelect_5_bit(rt,rd,RegDst,WriteReg);
    input [4:0] rt;
    input [4:0] rd;
    input RegDst;
    output [4:0] WriteReg;
    assign WriteReg = (RegDst==0)?rt:rd;
endmodule
