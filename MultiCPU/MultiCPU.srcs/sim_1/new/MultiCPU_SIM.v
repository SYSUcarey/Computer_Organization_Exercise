`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/25 02:43:14
// Design Name: 
// Module Name: MultiCPU_SIM
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


module MultiCPU_SIM();
    reg CLK,RST;
    wire [4:0]rs,rt;
    wire [31:0]nowPC,nextPC,ReadData1,ReadData2,ALUResult,DB;
    
	MultiCPU test(
        .CLK(CLK),
        .RST(RST),
        .nowPC(nowPC),
        .nextPC(nextPC),
        .rs(rs),
        .rt(rt),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2),
        .ALUResult(ALUResult),
        .DB(DB)
    );   
    always #50 CLK = !CLK;
	initial begin
        // Initialize Inputs
        CLK = 0;
        RST = 0;
        #50;
            RST = 1;
    end
endmodule
