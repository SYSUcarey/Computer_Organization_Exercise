`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/25 02:35:20
// Design Name: 
// Module Name: DBDR
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


module DBDR(CLK,inputData,outputData);
    input CLK;
    input [31:0]inputData;
    output reg [31:0]outputData;
    always@(posedge CLK) begin
        outputData<=inputData;
    end
endmodule
