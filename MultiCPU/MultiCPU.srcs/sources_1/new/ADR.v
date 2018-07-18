`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/25 01:34:50
// Design Name: 
// Module Name: ADR
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


module ADR(CLK,inputData,outputData);
    input CLK;
    input [31:0] inputData;
    output reg [31:0] outputData;
    always@(posedge CLK) begin
        outputData<=inputData;
    end
endmodule
