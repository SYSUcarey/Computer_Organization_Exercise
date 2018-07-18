`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/24 21:59:19
// Design Name: 
// Module Name: OutputFunction
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


module OutputFunction(State,Opcode,zero,sign,PCWre,IRWre,InsMemRW,WrRegDSrc,RegDst,RegWre,ALUOp,PCSrc,ALUSrcA,ALUSrcB,RD,WR,DBDataSrc,ExtSel);
    input [2:0]State;
    input [5:0]Opcode;
    input zero,sign;
    output reg PCWre,IRWre,InsMemRW,WrRegDSrc,RegWre,ALUSrcA,ALUSrcB,RD,WR,DBDataSrc,ExtSel;
    output reg [1:0] PCSrc,RegDst;
    output reg [2:0] ALUOp;
    
    // IF = 000, ID = 001, EXE = 010, WB = 011, MEM = 100
    // add = 000000, sub = 000001, addi = 000010
    // or = 010000, and = 010001, ori = 010010
    // sll = 011000
    // slt = 100110, sltiu = 100111
    // sw = 110000, lw = 110001
    // beq = 110100, bltz = 110110
    // j = 111000, jr = 111001, jal = 111010, halt = 111111 
    parameter [2:0] IF=3'b000, ID=3'b001, EXE=3'b010, WB=3'b011, MEM=3'b100;
    parameter [5:0] Add=6'b000000, Sub=6'b000001, Addi=6'b000010;
    parameter [5:0] Or=6'b010000, And=6'b010001, Ori=6'b010010;
    parameter [5:0] Sll=6'b011000;
    parameter [5:0] Slt=6'b100110, Sltiu=6'b100111;
    parameter [5:0] Sw=6'b110000, Lw=6'b110001;
    parameter [5:0] Beq=6'b110100, Bltz=6'b110110;
    parameter [5:0] J=6'b111000, Jr=6'b111001, Jal=6'b111010, Halt=6'b111111; 
    
    initial begin
        PCWre = 1;
        IRWre = 1;
    end
    
    always @ (State) begin
        // 确定PCWre的值
        if(State == IF && Opcode != Halt) PCWre = 1;   
        else PCWre = 0;
        // 确定ALUSrcA的值
        if(Opcode == Sll) ALUSrcA = 1;    
        else ALUSrcA = 0;
        // 确定ALUSrcB的值
        if(Opcode == Addi || Opcode == Ori || Opcode == Sltiu
                || Opcode == Lw || Opcode == Sw) ALUSrcB = 1;
        else ALUSrcB = 0;
        // 确定DBDataSrc的值
        if(Opcode == Lw) DBDataSrc = 1;
        else DBDataSrc = 0;
        // 确定RegWre的值
        if(((Opcode == Add || Opcode == Sub || Opcode == Addi || Opcode == Or || Opcode == And || Opcode == Ori
         || Opcode == Slt || Opcode == Sltiu || Opcode == Sll || Opcode == Lw) && State==WB) || Opcode == Jal)
             RegWre = 1;
        else RegWre = 0;
        // 确定WrRegDSrc的值
        if(Opcode == Jal) WrRegDSrc = 0;
        else WrRegDSrc = 1;
        // 确定InsMemRW的值
        //if(State == IF) InsMemRW = 1;
        InsMemRW = 1;
        // 确定RD的值
        if((Opcode == Lw && State == MEM) || (Opcode == Lw && State == EXE)) RD=1;
        else RD=0;
        // 确定WR的值
        if(Opcode == Sw && State == MEM) WR=1;
        else WR=0;
        // 确定IRWre的值
        if(State == IF) IRWre = 1;
        else IRWre = 0;
        // 确定ExtSel的值
        if (Opcode == Ori || Opcode == Sltiu) ExtSel = 0;
        else ExtSel = 1;
        // 确定PCSrc的值
        case (Opcode) 
            Jr : PCSrc = 2'b10;
            J : PCSrc = 2'b11;
            Jal : PCSrc = 2'b11;
            Beq : begin
                if (zero == 0) PCSrc = 2'b00;
                else PCSrc = 2'b01;
            end
            Bltz : begin
                if (zero == 0 && sign == 1) PCSrc = 2'b01;
                else PCSrc = 2'b00;
            end
            default : PCSrc = 2'b00;
        endcase
        // 确定RegDst的值
		if (Opcode == Jal) RegDst = 2'b00;
        else if (Opcode == Addi || Opcode == Ori || Opcode == Sltiu || Opcode == Lw) RegDst = 2'b01;
        else RegDst = 2'b10;
        // 确定ALUOp的值
		case (Opcode)
            Add : ALUOp = 3'b000;
            Sub : ALUOp = 3'b001;
            Addi : ALUOp = 3'b000;
            Or : ALUOp = 3'b101;
            And : ALUOp = 3'b110;
            Ori : ALUOp = 3'b101;
            Sll : ALUOp = 3'b100;
            Slt : ALUOp = 3'b011;
            Sltiu : ALUOp = 3'b010;
            Sw : ALUOp = 3'b000;
            Lw : ALUOp = 3'b000;
            Beq : ALUOp = 3'b001;
            Bltz : ALUOp = 3'b001;
        endcase        
    end
endmodule
