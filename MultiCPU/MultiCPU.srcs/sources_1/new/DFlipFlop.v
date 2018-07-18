`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/24 21:27:14
// Design Name: 
// Module Name: DFlipFlop
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

// 控制单元ControlUnit子模块
// D-Q触发器
module DFlipFlop(D,RST,CLK,Q);
    input [2:0] D;
    input RST;
    input CLK;
    output reg [2:0] Q;
    always @ (posedge CLK) begin
        if(RST==0) Q<=0;
        else Q<=D;
    end
endmodule
