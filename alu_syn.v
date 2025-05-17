module INV(IN, OUT);
input IN;
output OUT;
assign OUT = ~IN;
endmodule

module NAND2(A, B, OUT);
input A, B;
output OUT;
assign OUT = ~(A & B);
endmodule

module NOR2(A, B, OUT);
input A, B;
output OUT;
assign OUT = ~(A | B);
endmodule

module XOR2(A, B, OUT);
input A, B;
output OUT;
assign OUT = (A ^ B);
endmodule

module AOI21(A, B, C, OUT);
input A, B, C;
output OUT;
assign OUT = ~((A & B) | C);
endmodule

module AOI22(A, B, C, D, OUT);
input A, B, C, D;
output OUT;
assign OUT = ~((A & B) | (C & D));
endmodule

module OAI21(A, B, C, OUT);
input A, B, C;
output OUT;
assign OUT = ~((A | B) & C);
endmodule

module OAI22(A, B, C, D, OUT);
input A, B, C, D;
output OUT;
assign OUT = ~((A | B) & (C | D));
endmodule

module DFF( D, CLK, R, Q);
input D, CLK, R;
output Q;
reg Q;
always @(negedge CLK or posedge R)
  if (R == 1'b1)
    Q = 1'b0;
  else
    Q = D;
endmodule

module ALU ( clk, A, B, reset_n, select, F );
  input [2:0] A;
  input [2:0] B;
  output [2:0] F;
  input clk, reset_n, select;
  wire   N5, N6, N7, N9, N10, N11, N19, N20, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n23, n25, n26, n27, n28, n29, n30, n31;
  wire   [2:0] \sub_1_root_add_45_2/B_not ;

  INV \sub_1_root_add_45_2/U1_0  ( .IN(B[0]), .OUT(
        \sub_1_root_add_45_2/B_not [0]) );
  INV \sub_1_root_add_45_2/U1_1  ( .IN(B[1]), .OUT(
        \sub_1_root_add_45_2/B_not [1]) );
  DFF \F_out_reg[2]  ( .D(N7), .CLK(n23), .R(1'b0), .Q(F[2]) );
  DFF \F_out_reg[1]  ( .D(N6), .CLK(n23), .R(1'b0), .Q(F[1]) );
  DFF \F_out_reg[0]  ( .D(N5), .CLK(n23), .R(1'b0), .Q(F[0]) );
  XOR2 U3 ( .A(n8), .B(n9), .OUT(N20) );
  AOI21 U4 ( .A(A[1]), .B(n10), .C(n11), .OUT(n9) );
  INV U5 ( .IN(n12), .OUT(n11) );
  OAI21 U6 ( .A(n10), .B(A[1]), .C(\sub_1_root_add_45_2/B_not [1]), .OUT(n12)
         );
  XOR2 U7 ( .A(n10), .B(n13), .OUT(N19) );
  OAI21 U8 ( .A(n14), .B(n15), .C(n10), .OUT(N9) );
  NAND2 U9 ( .A(n15), .B(n14), .OUT(n10) );
  INV U10 ( .IN(A[0]), .OUT(n14) );
  XOR2 U11 ( .A(n16), .B(n8), .OUT(N11) );
  XOR2 U12 ( .A(B[2]), .B(A[2]), .OUT(n8) );
  OAI22 U13 ( .A(n17), .B(\sub_1_root_add_45_2/B_not [1]), .C(n18), .D(n19), 
        .OUT(n16) );
  INV U14 ( .IN(n20), .OUT(n17) );
  NAND2 U15 ( .A(n19), .B(n18), .OUT(n20) );
  INV U16 ( .IN(A[1]), .OUT(n19) );
  XOR2 U17 ( .A(n18), .B(n13), .OUT(N10) );
  XOR2 U18 ( .A(\sub_1_root_add_45_2/B_not [1]), .B(A[1]), .OUT(n13) );
  NAND2 U19 ( .A(A[0]), .B(n15), .OUT(n18) );
  INV U20 ( .IN(\sub_1_root_add_45_2/B_not [0]), .OUT(n15) );
  INV U23 ( .IN(clk), .OUT(n23) );
  INV U25 ( .IN(n25), .OUT(N7) );
  AOI22 U26 ( .A(N11), .B(n26), .C(N20), .D(n27), .OUT(n25) );
  INV U27 ( .IN(n28), .OUT(N6) );
  AOI22 U28 ( .A(N10), .B(n26), .C(N19), .D(n27), .OUT(n28) );
  INV U29 ( .IN(n29), .OUT(N5) );
  AOI22 U30 ( .A(N9), .B(n26), .C(N9), .D(n27), .OUT(n29) );
  NOR2 U31 ( .A(n30), .B(n31), .OUT(n27) );
  INV U32 ( .IN(select), .OUT(n30) );
  NOR2 U33 ( .A(n31), .B(select), .OUT(n26) );
  INV U34 ( .IN(reset_n), .OUT(n31) );
endmodule

