`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/24 18:02:27
// Design Name: 
// Module Name: Extend
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


module Extend(DataIn,ExtSel,DataOut);
    input [15:0] DataIn;
    input ExtSel;               //拓展方式信号，0为零拓展，1为符号拓展
    output reg [31:0] DataOut;
    
    always @(DataIn or ExtSel) begin
        if (ExtSel) begin
            DataOut <= {{16{DataIn[15]}}, DataIn[15:0]};
        end
        else begin
            DataOut <= {16'b0000000000000000, DataIn[15:0]};
        end
    end
endmodule
