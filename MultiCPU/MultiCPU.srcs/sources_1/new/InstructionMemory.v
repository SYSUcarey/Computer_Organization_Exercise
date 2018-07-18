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
    input InsMemRW;             // 读使能信号
    input [31:0] Iaddr;         // 存储器地址
    output reg [31:0] DataOut;  // 输出的数据
    reg [7:0] rom [99:0];       // 存储器定义必须用reg类型，存储器存储单元8位长度，共100个存储单元
    initial begin               // 加载数据到存储器rom。注意：必须使用绝对路径，如：E:/Xlinx/VivadoProject/ROM/（自己定）
        $readmemb ("F:/VivadoWork/MultiCPU/rom_data.txt", rom); // 数据文件rom_data（.coe或.txt）。未指定，就从0地址开始存放。
    end
    always @( InsMemRW or Iaddr ) begin
        if (InsMemRW==1) begin        // 为1，读存储器。大端数据存储模式
        DataOut[31:24] = rom[Iaddr];
        DataOut[23:16] = rom[Iaddr+1];
        DataOut[15:8] = rom[Iaddr+2];
        DataOut[7:0] = rom[Iaddr+3];
        end
    end
endmodule
