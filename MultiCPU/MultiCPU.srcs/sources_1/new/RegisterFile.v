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
    input CLK;                  //时钟信号
    input [4:0] ReadReg1;       //读寄存器1输入端口
    input [4:0] ReadReg2;       //读寄存器2输入端口
    input [4:0] WriteReg;       //写寄存器输入宽口
    input RegWre;               //读写控制信号输入
    input [31:0] WriteData;     //写寄存器输入数据
    output [31:0] ReadData1;    //读寄存器1输出数据
    output [31:0] ReadData2;    //度寄存器2输出数据
        
    reg [31:0] regFile[1:31];
    integer i;

    assign ReadData1 = (ReadReg1 == 0) ? 0 : regFile[ReadReg1];
    assign ReadData2 = (ReadReg2 == 0) ? 0 : regFile[ReadReg2];
    
    always @ (negedge CLK) begin
        if (RegWre == 1 && WriteReg != 0)
            regFile[WriteReg] <= WriteData;
    end
endmodule
