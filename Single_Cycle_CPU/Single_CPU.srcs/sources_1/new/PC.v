`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/22 15:12:53
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
    input CLK;
    input PCWre;
    input Reset;
    input [31:0] PCdata;
    output reg[31:0] Addr;
    
    always @ (negedge CLK) begin // ������ʱ�ӱ��ش���
        if (Reset==0) Addr <= 0;
        else if (PCWre == 1)
          Addr <= PCdata; // д���µ�ָ���ַ
    end
endmodule
