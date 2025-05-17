`timescale 1ns / 1ps


module ALU(
    input wire clk,
    input wire [2:0] A,
    input wire [2:0] B,
    input wire reset_n,
    input wire select,
    output wire [2:0] F
    );
reg [2:0] F_out;
reg [2:0] ALU_out;

always @ (posedge clk)begin
    if (~reset_n)begin
        F_out <= 4'd0;
    end else begin
       F_out <= ALU_out;
    end
end

always @ (*) begin
    case(select)
        1'd0:ALU_out = A+B;                 // Addition
        1'd1:ALU_out = A+(~B)+3'b001;       // Subtraction(2's complement addition)
    endcase
end

assign F = F_out;

endmodule

