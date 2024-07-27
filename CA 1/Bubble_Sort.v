`timescale 1ns/1ns

module Bubble_Sort (input clk, rst, start , output done);

    wire CO1, CO2, lt, gt, C1_clr, C2_clr, C1_ld, C2_ld, C1_inc, C2_inc, S0, S1, Reg1_ld, Reg2_ld, rd, wr;
    
    Controller  C(start, rst, clk, CO1, CO2, lt, gt, C1_clr, C2_clr, C1_ld, C2_ld, C1_inc, C2_inc, S0, S1, Reg1_ld, Reg2_ld, rd, wr, done);
    DATA_PATH   D(clk , S0 , S1 , Reg1_ld , Reg2_ld , C1_inc , C2_inc , C1_clr , C2_clr , C1_ld , C2_ld , rd , wr , CO1 , CO2 , lt , gt);

endmodule
