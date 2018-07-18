`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/24 17:27:06
// Design Name: 
// Module Name: PC
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

module PC(CLK,PCWre,Reset,PCdata,Addr);
    input CLK;          //时钟
    input PCWre;        //为0时停机，Addr输出不更改
    input Reset;        //为0时重置，Addr为0
    input [31:0] PCdata;
    output reg[31:0] Addr;
    
    initial begin 
        Addr = 0;
    end
    always @ (negedge CLK) begin // 必须用时钟边沿触发
        if (Reset==0) Addr <= 0;
        else if (PCWre == 1)
          Addr <= PCdata; // 写入新的指令地址
    end
endmodule
