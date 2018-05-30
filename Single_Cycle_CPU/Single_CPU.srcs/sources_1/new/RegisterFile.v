`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/25 08:43:46
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
    input CLK;  // ±÷”–≈∫≈
    input [4:0] ReadReg1;
    input [4:0] ReadReg2;
    input [4:0] WriteReg;
    input RegWre;
    input [31:0] WriteData;
    output [31:0] ReadData1;
    output [31:0] ReadData2;
        
    reg [31:0] regFile[1:31];
    integer i;

    assign ReadData1 = (ReadReg1 == 0) ? 0 : regFile[ReadReg1];
    assign ReadData2 = (ReadReg2 == 0) ? 0 : regFile[ReadReg2];
    
    always @ (negedge CLK) begin
        if (RegWre == 1 && WriteReg != 0)
            regFile[WriteReg] <= WriteData;
    end
endmodule
