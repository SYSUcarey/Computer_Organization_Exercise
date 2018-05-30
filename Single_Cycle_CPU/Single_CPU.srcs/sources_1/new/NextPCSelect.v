`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/27 19:07:17
// Design Name: 
// Module Name: NextPCSelect
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


module NextPCSelect(PC4,ExtendImm,PCJump,PCSrc, NextPC);
    input [31:0] PC4;
    input [31:0] ExtendImm;
    input [31:0] PCJump;
    input [1:0] PCSrc;
    output reg [31:0] NextPC;
    
    always @ (PC4 or ExtendImm or PCJump or PCSrc) begin
        case (PCSrc) 
            2'b00 : begin
                NextPC = PC4;
            end
            2'b01 : begin
                NextPC = (PC4 + ExtendImm*4);
            end
            2'b10 : begin
                NextPC = PCJump;
            end
            default : begin
            end
        endcase
    end
endmodule
