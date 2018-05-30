`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/22 15:35:49
// Design Name: 
// Module Name: PC_SIM
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


module PC_SIM();
    reg CLK;
    reg PCWre;
    reg Reset;
    reg [31:0] PCdata;
    wire [31:0] Addr;
    
    PC uut (
        .CLK(CLK),
        .PCWre(PCWre),
        .Reset(Reset),
        .PCdata(PCdata),
        .Addr(Addr)
    );
    
    always #50 CLK = !CLK;
    initial begin
        //Initialize Inputs
        CLK = 0;
        Reset = 0;
        PCWre = 0;
        PCdata = 0;
        #100;
        Reset = 1;
        PCWre = 1;
        PCdata = 1;
        #100;
        PCWre = 1;
        Reset = 1;
        PCdata = 2;
        #100;
        PCWre = 0;
        Reset = 1;
        PCdata = 3;
        #100;
        PCWre = 1;
        Reset = 0;
        PCdata = 4;
        #100;
        PCWre = 1;
        Reset = 1;
        PCdata = 5;
    end
endmodule
