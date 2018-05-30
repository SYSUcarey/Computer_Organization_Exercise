`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/27 17:30:08
// Design Name: 
// Module Name: DataSelect_32_bit
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


module DataSelect_32_bit(NumA,NumB,DBDataSrc,WriteData);
    input [31:0] NumA;
    input [31:0] NumB;
    input DBDataSrc;
    output [31:0] WriteData;
    assign WriteData = (DBDataSrc==0)?NumA:NumB;
endmodule
