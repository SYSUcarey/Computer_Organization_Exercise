`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/25 09:26:48
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(CLK, Daddr, DataIn, RD, WR, DataOut);
    input CLK;                  //ʱ���ź�
    input [31:0] Daddr;         //��ַ����
    input [31:0] DataIn;        //��������
    input RD;                   //�������źţ�Ϊ1ʱ��
    input WR;                   //д�����źţ�Ϊ1ʱд
    output [31:0] DataOut;  //�������
    
    reg [7:0] ram [0:60];       //�洢��
    
    // ��
    assign DataOut[7:0] = (RD==1)?ram[Daddr + 3]:8'bz; // z Ϊ����̬
    assign DataOut[15:8] = (RD==1)?ram[Daddr + 2]:8'bz;
    assign DataOut[23:16] = (RD==1)?ram[Daddr + 1]:8'bz;
    assign DataOut[31:24] = (RD==1)?ram[Daddr ]:8'bz;
    
    // д
    always@( negedge CLK ) begin
        if( WR==1 ) begin
            ram[Daddr] <= DataIn[31:24];
            ram[Daddr+1] <= DataIn[23:16];
            ram[Daddr+2] <= DataIn[15:8];
            ram[Daddr+3] <= DataIn[7:0];
        end
    end
endmodule
