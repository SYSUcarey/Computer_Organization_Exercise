`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/24 18:04:01
// Design Name: 
// Module Name: PCAddFour
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

//PC��4ģ�飬�����õ���һ��ָ��ĵ�ַ
module PCAddFour(PCIn,PCOut);
    input [31:0] PCIn;
    output [31:0] PCOut;
    assign PCOut[31:0] = PCIn[31:0] + 4; 
endmodule
