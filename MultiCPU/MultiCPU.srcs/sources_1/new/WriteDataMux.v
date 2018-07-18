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

//用来选择RegisterFile的WriteData输入端口的值
module WriteDataMux(Data1,Data2,WrRegDSrc,WriteData);
    input [31:0] Data1;     //PC4的值
    input [31:0] Data2;     //rt或rd
    input WrRegDSrc;        //选择控制信号  
    output [31:0] WriteData;  //选择结果输出
    assign WriteData = (WrRegDSrc==0)?Data1:Data2;
endmodule
