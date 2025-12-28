`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2025 17:10:57
// Design Name: 
// Module Name: tb_alu
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


module tb_alu;

parameter width = 8;

reg  [width-1:0] a,b;
reg  [2:0]       alu_ctrl;
wire [width-1:0] result;
wire             zero;
wire             carry;
wire             overflow;

alu #(width) dut (
    .A(a),
    .B(b),
    .alu_ctrl(alu_ctrl),
    .result(result),
    .zero(zero),
    .carry(carry),
    .overflow(overflow)
);

initial begin
    // ADD
    a = 8'd10; b = 8'd5; alu_ctrl = 3'b000; #10;
    a = 8'd250; b = 8'd10; alu_ctrl = 3'b000; #10;
    // Expect: result = 4, carry = 1
    a = 8'sd127; b = 8'sd1; alu_ctrl = 3'b000; #10;
// Expect: overflow = 1    // SUB
    a = 8'd10; b = 8'd5; alu_ctrl = 3'b001; #10;                                                                                                                                                                                                                                        
    a = 8'sd128; b = 8'sd1; alu_ctrl = 3'b001; #10;
    // Expect: overflow = 1
    // AND
    a = 8'b1100; b = 8'b1010; alu_ctrl = 3'b010; #10;

    // OR
    alu_ctrl = 3'b011; #10;

    // XOR
    alu_ctrl = 3'b100; #10;

    // Shift Left
    alu_ctrl = 3'b101; #10;

    // Shift Right
    alu_ctrl = 3'b110; #10;

    // SLT
    a = 8'd3; b = 8'd7; alu_ctrl = 3'b111; #10;

    $finish;
end

endmodule

