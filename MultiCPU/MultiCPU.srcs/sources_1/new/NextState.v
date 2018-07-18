`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/24 21:36:28
// Design Name: 
// Module Name: NextState
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

// 控制单元ControlUnit子模块
// 控制状态
// 000-IF，001-ID，010-EXE，011-WB，100MEM
module NextState(Q,Opcode,Nextstate);
    input [2:0] Q;
    input [5:0] Opcode;
    output reg [2:0] Nextstate;
    initial begin
        Nextstate = 3'b000;
    end
    always @ (Q or Opcode) begin
        case (Q) 
            3'b000 : Nextstate = 3'b001;
            3'b001 : begin
                if(Opcode == 6'b111000 || Opcode == 6'b111001 || Opcode == 6'b111010 || Opcode == 6'b111111) 
                    Nextstate = 3'b000;     //j,jal,jr,halt
                else Nextstate = 3'b010;
            end
            3'b010 : begin
                if(Opcode == 6'b110100 || Opcode == 6'b110110) Nextstate = 3'b000;  //beq,bltz
                else if(Opcode == 6'b110000 || Opcode == 6'b110001) Nextstate = 3'b100; //sw,lw
                else Nextstate = 3'b011;    
            end
            3'b011 : begin 
                Nextstate = 3'b000;
            end 
            3'b100 : begin
                if (Opcode == 6'b110001) Nextstate = 3'b011;    //lw
                else Nextstate = 3'b000;    //sw
            end
        endcase
    end
endmodule
