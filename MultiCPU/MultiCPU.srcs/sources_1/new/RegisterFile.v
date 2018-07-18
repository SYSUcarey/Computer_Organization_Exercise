`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/24 17:34:30
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(CLK, ReadReg1, ReadReg2, WriteReg, RegWre, WriteData, ReadData1, ReadData2);
    input CLK;                  //ʱ���ź�
    input [4:0] ReadReg1;       //���Ĵ���1����˿�
    input [4:0] ReadReg2;       //���Ĵ���2����˿�
    input [4:0] WriteReg;       //д�Ĵ���������
    input RegWre;               //��д�����ź�����
    input [31:0] WriteData;     //д�Ĵ�����������
    output [31:0] ReadData1;    //���Ĵ���1�������
    output [31:0] ReadData2;    //�ȼĴ���2�������
        
    reg [31:0] regFile[1:31];
    integer i;

    assign ReadData1 = (ReadReg1 == 0) ? 0 : regFile[ReadReg1];
    assign ReadData2 = (ReadReg2 == 0) ? 0 : regFile[ReadReg2];
    
    always @ (negedge CLK) begin
        if (RegWre == 1 && WriteReg != 0)
            regFile[WriteReg] <= WriteData;
    end
endmodule
