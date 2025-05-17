`timescale 1ns / 1ps

module tb_ALU;
reg [2:0] A;
reg [2:0] B;
reg select;
reg clk;
reg reset_n;
wire [2:0] F;

always #5 clk = ~clk;   

ALU dut (
    .A(A),
    .B(B),
    .select(select),
    .clk(clk),
    .reset_n(reset_n),
    .F(F)
);

initial begin
    clk = 1;
    A = 3'd0;
    B = 3'd0;
    reset_n = 0;
    select = 1'd0;
    #10;
    reset_n = 1;
    A = 3'd4;
    B = 3'd3;
    #10;
    select =1'd1;
    #10;
    A = 3'd3;
    B = 3'd1;
    #10;
    select = 1'd0;
    #20;
    $finish;
end

endmodule

