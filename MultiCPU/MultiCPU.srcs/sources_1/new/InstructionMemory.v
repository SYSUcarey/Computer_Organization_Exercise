`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/12 16:50:51
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory(InsMemRW, Iaddr, DataOut);
    input InsMemRW;             // ��ʹ���ź�
    input [31:0] Iaddr;         // �洢����ַ
    output reg [31:0] DataOut;  // ���������
    reg [7:0] rom [99:0];       // �洢�����������reg���ͣ��洢���洢��Ԫ8λ���ȣ���100���洢��Ԫ
    initial begin               // �������ݵ��洢��rom��ע�⣺����ʹ�þ���·�����磺E:/Xlinx/VivadoProject/ROM/���Լ�����
        $readmemb ("F:/VivadoWork/MultiCPU/rom_data.txt", rom); // �����ļ�rom_data��.coe��.txt����δָ�����ʹ�0��ַ��ʼ��š�
    end
    always @( InsMemRW or Iaddr ) begin
        if (InsMemRW==1) begin        // Ϊ1�����洢����������ݴ洢ģʽ
        DataOut[31:24] = rom[Iaddr];
        DataOut[23:16] = rom[Iaddr+1];
        DataOut[15:8] = rom[Iaddr+2];
        DataOut[7:0] = rom[Iaddr+3];
        end
    end
endmodule
