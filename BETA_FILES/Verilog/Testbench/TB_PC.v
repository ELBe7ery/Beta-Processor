`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Abdelrahman Elbehery
//
// Create Date:   01:03:03 02/10/2017
// Design Name:   PC
// Module Name:   F:/Self learning/FPGA/Projects/BETA_ISE/TB_PC.v
// Project Name:  BETA_ISE
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB_PC;
  reg CLK=0;
  integer weAreOk=1;

  task PRINT;
    input integer CN;
    input [31:0] PC;
    input [31:0] ExPC;
    input [31:0] PC_INC;
    input [31:0] ExPC_INC;
    input [31:0] PC_OFFSET;
    input [31:0] ExPC_OFFSET;
    if( PC!=ExPC | PC_INC!=ExPC_INC | PC_OFFSET!=ExPC_OFFSET ) begin
    $display("Error in case: %d\nPC: %b\nExpected: %b\nPC_INC: %b\nExpected: %b\nPC_OFFSET: %b\nExpected: %b\n",CN,PC,ExPC,PC_INC,ExPC_INC,PC_OFFSET,ExPC_OFFSET);
    weAreOk=0;
    end
  endtask

  reg  RESET;
  reg [2:0] PCSEL;
  reg [15:0] ID;
  reg [31:0] JT;
  wire [31:0] PC;
  wire [31:0] PC_INC;
  wire [31:0] PC_OFFSET;

  PC uut(.CLK(CLK),.RESET(RESET),.PCSEL(PCSEL),.ID(ID),.JT(JT),.PC(PC),.PC_INC(PC_INC),.PC_OFFSET(PC_OFFSET));



initial begin
  //CASE: 1
  RESET=1'b1;
  PCSEL=3'b011;
  ID=16'b1111111111111111;
  JT=32'b00000000000000000000000000000000;
  #1;
  CLK=1;
  #10;
  CLK=0;
  PRINT(1,PC,32'b10000000000000000000000000000000,PC_INC,32'b10000000000000000000000000000100,PC_OFFSET,32'b10000000000000000000000000000000);
  #10;

  //CASE: 2
  RESET=1'b1;
  PCSEL=3'b011;
  ID=16'b1111111111111111;
  JT=32'b00000000000000000000000000000000;
  #1;
  CLK=1;
  #10;
  CLK=0;
  PRINT(2,PC,32'b10000000000000000000000000000000,PC_INC,32'b10000000000000000000000000000100,PC_OFFSET,32'b10000000000000000000000000000000);
  #10;

  //CASE: 3
  RESET=1'b1;
  PCSEL=3'b100;
  ID=16'b0000000000000000;
  JT=32'b00000000000000000000000000000000;
  #1;
  CLK=1;
  #10;
  CLK=0;
  PRINT(3,PC,32'b10000000000000000000000000000000,PC_INC,32'b10000000000000000000000000000100,PC_OFFSET,32'b10000000000000000000000000000100);
  #10;

  //CASE: 4
  RESET=1'b0;
  PCSEL=3'b100;
  ID=16'b1111111111111110;
  JT=32'b00000000000000000000000000000000;
  #1;
  CLK=1;
  #10;
  CLK=0;
  PRINT(4,PC,32'b10000000000000000000000000001000,PC_INC,32'b10000000000000000000000000001100,PC_OFFSET,32'b10000000000000000000000000000100);
  #10;

  //CASE: 5
  RESET=1'b0;
  PCSEL=3'b011;
  ID=16'b0111111111111111;
  JT=32'b00000000000000000000000000000000;
  #1;
  CLK=1;
  #10;
  CLK=0;
  PRINT(5,PC,32'b10000000000000000000000000000100,PC_INC,32'b10000000000000000000000000001000,PC_OFFSET,32'b10000000000000100000000000000100);
  #10;

  //CASE: 6
  RESET=1'b0;
  PCSEL=3'b010;
  ID=16'b0000000000000000;
  JT=32'b11111111111111111111111111110000;
  #1;
  CLK=1;
  #10;
  CLK=0;
  PRINT(6,PC,32'b11111111111111111111111111110000,PC_INC,32'b11111111111111111111111111110100,PC_OFFSET,32'b11111111111111111111111111110100);
  #10;

  //CASE: 7
  RESET=1'b0;
  PCSEL=3'b000;
  ID=16'b1111111111111111;
  JT=32'b00000000000000000000000000000000;
  #1;
  CLK=1;
  #10;
  CLK=0;
  PRINT(7,PC,32'b11111111111111111111111111110100,PC_INC,32'b11111111111111111111111111111000,PC_OFFSET,32'b11111111111111111111111111110100);
  #10;

  //CASE: 8
  RESET=1'b0;
  PCSEL=3'b000;
  ID=16'b1111111111111110;
  JT=32'b00000000000000000000000000000000;
  #1;
  CLK=1;
  #10;
  CLK=0;
  PRINT(8,PC,32'b11111111111111111111111111111000,PC_INC,32'b11111111111111111111111111111100,PC_OFFSET,32'b11111111111111111111111111110100);
  #10;

  //CASE: 9
  RESET=1'b0;
  PCSEL=3'b000;
  ID=16'b1111111111111101;
  JT=32'b00000000000000000000000000000000;
  #1;
  CLK=1;
  #10;
  CLK=0;
  PRINT(9,PC,32'b11111111111111111111111111111100,PC_INC,32'b10000000000000000000000000000000,PC_OFFSET,32'b11111111111111111111111111110100);
  #10;

  //CASE: 10
  RESET=1'b0;
  PCSEL=3'b000;
  ID=16'b1111111111111100;
  JT=32'b00000000000000000000000000000000;
  #1;
  CLK=1;
  #10;
  CLK=0;
  PRINT(10,PC,32'b10000000000000000000000000000000,PC_INC,32'b10000000000000000000000000000100,PC_OFFSET,32'b11111111111111111111111111110100);
  #10;

  //CASE: 11
  RESET=1'b0;
  PCSEL=3'b010;
  ID=16'b1000000000000000;
  JT=32'b01111111111111111111111111111111;
  #1;
  CLK=1;
  #10;
  CLK=0;
  PRINT(11,PC,32'b01111111111111111111111111111100,PC_INC,32'b00000000000000000000000000000000,PC_OFFSET,32'b01111111111111100000000000000000);
  #10;

  //CASE: 12
  RESET=1'b0;
  PCSEL=3'b010;
  ID=16'b1111111111110111;
  JT=32'b10000111011001010100001100100001;
  #1;
  CLK=1;
  #10;
  CLK=0;
  PRINT(12,PC,32'b00000111011001010100001100100000,PC_INC,32'b00000111011001010100001100100100,PC_OFFSET,32'b00000111011001010100001100000000);
  #10;

  //CASE: 13
  RESET=1'b0;
  PCSEL=3'b010;
  ID=16'b0000000000000000;
  JT=32'b00000000000000000000000000000100;
  #1;
  CLK=1;
  #10;
  CLK=0;
  PRINT(13,PC,32'b00000000000000000000000000000100,PC_INC,32'b00000000000000000000000000001000,PC_OFFSET,32'b00000000000000000000000000001000);
  #10;

  //CASE: 14
  RESET=1'b0;
  PCSEL=3'b000;
  ID=16'b0000000000000000;
  JT=32'b00000000000000000000000000000000;
  #1;
  CLK=1;
  #10;
  CLK=0;
  PRINT(14,PC,32'b00000000000000000000000000001000,PC_INC,32'b00000000000000000000000000001100,PC_OFFSET,32'b00000000000000000000000000001100);
  #10;

  //CASE: 15
  RESET=1'b0;
  PCSEL=3'b000;
  ID=16'b0000000000000000;
  JT=32'b00000000000000000000000000000000;
  #1;
  CLK=1;
  #10;
  CLK=0;
  PRINT(15,PC,32'b00000000000000000000000000001100,PC_INC,32'b00000000000000000000000000010000,PC_OFFSET,32'b00000000000000000000000000010000);
  #10;

  //CASE: 16
  RESET=1'b0;
  PCSEL=3'b000;
  ID=16'b0000000000000000;
  JT=32'b00000000000000000000000000000000;
  #1;
  CLK=1;
  #10;
  CLK=0;
  PRINT(16,PC,32'b00000000000000000000000000010000,PC_INC,32'b00000000000000000000000000010100,PC_OFFSET,32'b00000000000000000000000000010100);
  #10;

  //CASE: 17
  RESET=1'b0;
  PCSEL=3'b001;
  ID=16'b0000000000000010;
  JT=32'b00000000000000000000000011110000;
  #1;
  CLK=1;
  #10;
  CLK=0;
  PRINT(17,PC,32'b00000000000000000000000000011100,PC_INC,32'b00000000000000000000000000100000,PC_OFFSET,32'b00000000000000000000000000101000);
  #10;

  //CASE: 18
  RESET=1'b0;
  PCSEL=3'b000;
  ID=16'b0000000000000000;
  JT=32'b00000000000000000000000000000000;
  #1;
  CLK=1;
  #10;
  CLK=0;
  PRINT(18,PC,32'b00000000000000000000000000100000,PC_INC,32'b00000000000000000000000000100100,PC_OFFSET,32'b00000000000000000000000000100100);
  #10;

  //CASE: 19
  RESET=1'b0;
  PCSEL=3'b010;
  ID=16'b0000000000000000;
  JT=32'b00000000000000000000000000111100;
  #1;
  CLK=1;
  #10;
  CLK=0;
  PRINT(19,PC,32'b00000000000000000000000000111100,PC_INC,32'b00000000000000000000000001000000,PC_OFFSET,32'b00000000000000000000000001000000);
  #10;

  //CASE: 20
  RESET=1'b0;
  PCSEL=3'b000;
  ID=16'b0000000000000000;
  JT=32'b00000000000000000000000000000000;
  #1;
  CLK=1;
  #10;
  CLK=0;
  PRINT(20,PC,32'b00000000000000000000000001000000,PC_INC,32'b00000000000000000000000001000100,PC_OFFSET,32'b00000000000000000000000001000100);
  #10;

  //CASE: 21
  RESET=1'b0;
  PCSEL=3'b010;
  ID=16'b0000000000000000;
  JT=32'b00000000000000000000000001111100;
  #1;
  CLK=1;
  #10;
  CLK=0;
  PRINT(21,PC,32'b00000000000000000000000001111100,PC_INC,32'b00000000000000000000000010000000,PC_OFFSET,32'b00000000000000000000000010000000);
  #10;

  //CASE: 22
  RESET=1'b0;
  PCSEL=3'b000;
  ID=16'b0000000000000000;
  JT=32'b00000000000000000000000000000000;
  #1;
  CLK=1;
  #10;
  CLK=0;
  PRINT(22,PC,32'b00000000000000000000000010000000,PC_INC,32'b00000000000000000000000010000100,PC_OFFSET,32'b00000000000000000000000010000100);
  #10;

  //CASE: 23
  RESET=1'b0;
  PCSEL=3'b010;
  ID=16'b0000000000000000;
  JT=32'b00000000000000001111111111111100;
  #1;
  CLK=1;
  #10;
  CLK=0;
  PRINT(23,PC,32'b00000000000000001111111111111100,PC_INC,32'b00000000000000010000000000000000,PC_OFFSET,32'b00000000000000010000000000000000);
  #10;

  //CASE: 24
  RESET=1'b0;
  PCSEL=3'b000;
  ID=16'b0000000000000000;
  JT=32'b00000000000000000000000000000000;
  #1;
  CLK=1;
  #10;
  CLK=0;
  PRINT(24,PC,32'b00000000000000010000000000000000,PC_INC,32'b00000000000000010000000000000100,PC_OFFSET,32'b00000000000000010000000000000100);
  #10;

  //CASE: 25
  RESET=1'b0;
  PCSEL=3'b010;
  ID=16'b0000000000000000;
  JT=32'b00000000111111111111111111111100;
  #1;
  CLK=1;
  #10;
  CLK=0;
  PRINT(25,PC,32'b00000000111111111111111111111100,PC_INC,32'b00000001000000000000000000000000,PC_OFFSET,32'b00000001000000000000000000000000);
  #10;

  //CASE: 26
  RESET=1'b0;
  PCSEL=3'b000;
  ID=16'b0000000000000000;
  JT=32'b00000000000000000000000000000000;
  #1;
  CLK=1;
  #10;
  CLK=0;
  PRINT(26,PC,32'b00000001000000000000000000000000,PC_INC,32'b00000001000000000000000000000100,PC_OFFSET,32'b00000001000000000000000000000100);
  #10;

  //CASE: 27
  RESET=1'b0;
  PCSEL=3'b010;
  ID=16'b0000000000000000;
  JT=32'b01111111111111111111111111111100;
  #1;
  CLK=1;
  #10;
  CLK=0;
  PRINT(27,PC,32'b01111111111111111111111111111100,PC_INC,32'b00000000000000000000000000000000,PC_OFFSET,32'b00000000000000000000000000000000);
  #10;

  //CASE: 28
  RESET=1'b0;
  PCSEL=3'b000;
  ID=16'b1111111111111110;
  JT=32'b00000000000000000000000000000000;
  #1;
  CLK=1;
  #10;
  CLK=0;
  PRINT(28,PC,32'b00000000000000000000000000000000,PC_INC,32'b00000000000000000000000000000100,PC_OFFSET,32'b01111111111111111111111111111100);
  #10;


  if(weAreOk) $display("TEST OK\n\nPassed");


  end

endmodule