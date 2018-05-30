`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/25 09:47:29
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(opcode, zero, PCWre, InsMemRW, RegDst, RegWre, ALUOp, PCSrc, ALUSrcA, ALUSrcB, mRD, mWR, DBDataSrc, ExtSel);
    input [5:0] opcode;
    input zero;
    output reg PCWre;
    output reg InsMemRW;
    output reg RegDst;
    output reg RegWre;
    output reg [2:0] ALUOp;
    output reg [1:0] PCSrc;
    output reg ALUSrcA;
    output reg ALUSrcB;
    output reg mRD;
    output reg mWR;
    output reg DBDataSrc;
    output reg ExtSel;
    
    initial begin 
        PCWre = 1;        
        InsMemRW = 1; 
        RegDst = 1;
        RegWre = 0;
        ALUOp = 3'b000;
        PCSrc = 2'b00;
        ALUSrcA = 0;
        ALUSrcB = 0;
        mRD = 0;
        mWR = 0;
        DBDataSrc = 0;
        ExtSel = 0;
    end
	
	always @(opcode or zero) begin 
		case (opcode)
			6'b000000 : begin			//1. add 
				PCWre = 1;  
				ALUSrcA = 0;
                ALUSrcB = 0; 
                DBDataSrc = 0;   
                RegWre = 1;  
                InsMemRW = 1; 
                mRD = 0;
                mWR = 0;
                RegDst = 1;
                ExtSel = 0;
                PCSrc = 2'b00;
                ALUOp = 3'b000;            
			end
			
			6'b000001 : begin			//2.addi
				PCWre = 1;  
				ALUSrcA = 0;
                ALUSrcB = 1; 
                DBDataSrc = 0;   
                RegWre = 1;  
                InsMemRW = 1; 
                mRD = 0;
                mWR = 0;
                RegDst = 0;
                ExtSel = 1;
                PCSrc = 2'b00;
                ALUOp = 3'b000;            
			end
			
			6'b000010 : begin			//3.sub
				PCWre = 1;  
				ALUSrcA = 0;
                ALUSrcB = 0; 
                DBDataSrc = 0;   
                RegWre = 1;  
                InsMemRW = 1; 
                mRD = 0;
                mWR = 0;
                RegDst = 1;
                ExtSel = 0;
                PCSrc = 2'b00;
                ALUOp = 3'b001;            
			end
			
			6'b010000 : begin			//4. ori
				PCWre = 1;  
				ALUSrcA = 0;
                ALUSrcB = 1; 
                DBDataSrc = 0;   
                RegWre = 1;  
                InsMemRW = 1; 
                mRD = 0;
                mWR = 0;
                RegDst = 0;
                ExtSel = 0;
                PCSrc = 2'b00;
                ALUOp = 3'b011;            
			end
			
			6'b010001 : begin			//5.and
				PCWre = 1;  
				ALUSrcA = 0;
                ALUSrcB = 0; 
                DBDataSrc = 0;   
                RegWre = 1;  
                InsMemRW = 1; 
                mRD = 0;
                mWR = 0;
                RegDst = 1;
                ExtSel = 0;
                PCSrc = 2'b00;
                ALUOp = 3'b100;            
			end
			
			6'b010010 : begin			//6. or
				PCWre = 1;  
				ALUSrcA = 0;
                ALUSrcB = 0; 
                DBDataSrc = 0;   
                RegWre = 1;  
                InsMemRW = 1; 
                mRD = 0;
                mWR = 0;
                RegDst = 1;
                ExtSel = 0;
                PCSrc = 2'b00;
                ALUOp = 3'b011;            
			end
			
			6'b011000 : begin			//7.sll
				PCWre = 1;  
				ALUSrcA = 1;
                ALUSrcB = 0; 
                DBDataSrc = 0;   
                RegWre = 1;  
                InsMemRW = 1; 
                mRD = 0;
                mWR = 0;
                RegDst = 1;
                ExtSel = 0;
                PCSrc = 2'b00;
                ALUOp = 3'b010;            
			end
			
			6'b011011 : begin			//8. slti
				PCWre = 1;  
				ALUSrcA = 0;
                ALUSrcB = 1; 
                DBDataSrc = 0;   
                RegWre = 1;  
                InsMemRW = 1; 
                mRD = 0;
                mWR = 0;
                RegDst = 0;
                ExtSel = 1;
                PCSrc = 2'b00;
                ALUOp = 3'b110;            
			end
			
			6'b100110 : begin			//9. sw
				PCWre = 1;  
				ALUSrcA = 0;
                ALUSrcB = 1; 
                DBDataSrc = 0;   
                RegWre = 0;  
                InsMemRW = 1; 
                mRD = 0;
                mWR = 1;
                RegDst = 0;
                ExtSel = 1;
                PCSrc = 2'b00;
                ALUOp = 3'b000;            
			end
			
			6'b100111 : begin			//10. lw
				PCWre = 1;  
				ALUSrcA = 0;
                ALUSrcB = 1; 
                DBDataSrc = 1;   
                RegWre = 1;  
                InsMemRW = 1; 
                mRD = 1;
                mWR = 0;
                RegDst = 0;
                ExtSel = 1;
                PCSrc = 2'b00;
                ALUOp = 3'b000;            
			end
			
			6'b110000 : begin			//11. beq
				PCWre = 1;  
				ALUSrcA = 0;
                ALUSrcB = 0; 
                DBDataSrc = 0;   
                RegWre = 0;  
                InsMemRW = 1; 
                mRD = 0;
                mWR = 0;
                RegDst = 0;
                ExtSel = 1;
                PCSrc = (zero==0)?2'b00:2'b01;
                ALUOp = 3'b111;            
			end
			
			6'b110001 : begin			//12.bne
				PCWre = 1;  
				ALUSrcA = 0;
                ALUSrcB = 0; 
                DBDataSrc = 0;   
                RegWre = 0;  
                InsMemRW = 1; 
                mRD = 0;
                mWR = 0;
                RegDst = 0;
                ExtSel = 1;
                PCSrc = (zero==0)?2'b01:2'b00;
                ALUOp = 3'b111;            
			end
			
			6'b111000 : begin			//13.j
				PCWre = 1;  
				ALUSrcA = 0;
                ALUSrcB = 0; 
                DBDataSrc = 0;   
                RegWre = 0;  
                InsMemRW = 1; 
                mRD = 0;
                mWR = 0;
                RegDst = 0;
                ExtSel = 0;
                PCSrc = 10;
                ALUOp = 3'b000;            
			end
			
			6'b111111 : begin			//14.halt
				PCWre = 0;  
				ALUSrcA = 0;
                ALUSrcB = 0; 
                DBDataSrc = 0;   
                RegWre = 0;  
                InsMemRW = 1; 
                mRD = 0;
                mWR = 0;
                RegDst = 0;
                ExtSel = 0;
                PCSrc = 00;
                ALUOp = 3'b000;            
			end
			
		endcase
	end
	
    
endmodule
