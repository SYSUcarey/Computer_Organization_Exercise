`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/25 02:32:08
// Design Name: 
// Module Name: DBMux
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


module DBMux(DBDataSrc,inputData1,inputData2,outputData);
    input DBDataSrc;
    input [31:0] inputData1,inputData2;
    output [31:0]outputData;
    assign outputData = (DBDataSrc==0)?inputData1:inputData2;
endmodule
