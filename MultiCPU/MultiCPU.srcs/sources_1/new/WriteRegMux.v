`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/24 18:14:20
// Design Name: 
// Module Name: WriteRegMux
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

//用来选择RegisterFile的WriteReg输入端口的值
module WriteRegMux(Data1,Data2,Data3,RegDst,WriteReg);
    input [4:0] Data1;  //jr $31时用到的
    input [4:0] Data2;  //rs
    input [4:0] Data3;  //rt
    input [1:0] RegDst; //选择信号
    output reg [4:0] WriteReg;  //选择结果输出
    always @ (Data1 or Data2 or Data3 or RegDst) begin
        case (RegDst) 
            2'b00 : WriteReg = Data1;
            2'b01 : WriteReg = Data2;
            2'b10 : WriteReg = Data3;
        endcase
    end
endmodule
