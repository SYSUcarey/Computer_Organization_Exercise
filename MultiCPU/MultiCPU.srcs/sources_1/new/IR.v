`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/25 01:30:04
// Design Name: 
// Module Name: IR
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


module IR(CLK,IRWre,inputData,outputData);
    input CLK,IRWre;
    input [31:0] inputData;
    output reg [31:0] outputData;
    always @ (posedge CLK) begin
        if(IRWre == 1) outputData <= inputData;
    end
endmodule
