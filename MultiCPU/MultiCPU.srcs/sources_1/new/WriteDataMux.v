`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/24 18:25:01
// Design Name: 
// Module Name: WriteDataMux
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

//����ѡ��RegisterFile��WriteData����˿ڵ�ֵ
module WriteDataMux(Data1,Data2,WrRegDSrc,WriteData);
    input [31:0] Data1;     //PC4��ֵ
    input [31:0] Data2;     //rt��rd
    input WrRegDSrc;        //ѡ������ź�  
    output [31:0] WriteData;  //ѡ�������
    assign WriteData = (WrRegDSrc==0)?Data1:Data2;
endmodule
