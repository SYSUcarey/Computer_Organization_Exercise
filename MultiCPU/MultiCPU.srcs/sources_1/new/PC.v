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
    input CLK;          //ʱ��
    input PCWre;        //Ϊ0ʱͣ����Addr���������
    input Reset;        //Ϊ0ʱ���ã�AddrΪ0
    input [31:0] PCdata;
    output reg[31:0] Addr;
    
    initial begin 
        Addr = 0;
    end
    always @ (negedge CLK) begin // ������ʱ�ӱ��ش���
        if (Reset==0) Addr <= 0;
        else if (PCWre == 1)
          Addr <= PCdata; // д���µ�ָ���ַ
    end
endmodule
