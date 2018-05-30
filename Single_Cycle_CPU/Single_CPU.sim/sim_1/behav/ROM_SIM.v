`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/15 16:55:41
// Design Name: 
// Module Name: ROM_SIM
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


module ROM_SIM();
    reg rd;
    reg [31:0] addr;
    //output
    wire [31:0] dataOut;
    
    // Instantiate the Unit Under Test (UUT)
    ROM uut (
    .rd(rd),
    .addr(addr),
    .dataOut(dataOut)
    );

    initial begin
        // Initialize Inputs
        rd = 0;
        addr = 0;
        //Wait 100 ns for another dataRead
        #100;
        rd = 0;
        addr = 4;
    end
endmodule
