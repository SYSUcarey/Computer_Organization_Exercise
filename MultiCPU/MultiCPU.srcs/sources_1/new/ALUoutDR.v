`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/25 01:39:32
// Design Name: 
// Module Name: ALUoutDR
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


module ALUoutDR(CLK,inputData,outputData);
    input CLK;
    input [31:0] inputData;
    output reg [31:0] outputData;
    always @ (posedge CLK) begin
        outputData<=inputData;
    end
endmodule
