`timescale 1ns/1ns
module DATA_PATH(clk , S0 , S1 , Reg1_ld , Reg2_ld , C1_inc , C2_inc , C1_clr , C2_clr , C1_ld , C2_ld , rd , wr , CO1 , CO2 , lt , gt );

input clk , S0 , S1 , Reg1_ld , Reg2_ld , C1_inc , C2_inc , C1_clr , C2_clr , C1_ld , C2_ld , rd , wr;
output CO1 , CO2 , lt , gt ;

wire [5:0] Parallel_out_C1 , Parallel_out_C2 , Parallel_IN_C2 ;
wire [4:0] address;
wire [7:0] Parallel_out_Reg1 , Parallel_out_Reg2, Write_DATA , Read_DATA ;
wire [5:0] load = 6'b0;

MUX_5bit MUX5(S0, {Parallel_out_C1[4],Parallel_out_C1[3],Parallel_out_C1[2],Parallel_out_C1[1],Parallel_out_C1[0]} , {Parallel_out_C2[4],Parallel_out_C2[3],Parallel_out_C2[2],Parallel_out_C2[1],Parallel_out_C2[0]} , address);

Counter_6bit C1(load, clk, C1_inc, C1_ld, C1_clr, Parallel_out_C1 , CO1);

Counter_6bit C2(Parallel_out_C1, clk,C2_inc, C2_ld, C2_clr, Parallel_out_C2 , CO2);

Register Reg1(Read_DATA, clk,Reg1_ld, Parallel_out_Reg1);

Register Reg2(Read_DATA, clk,Reg2_ld, Parallel_out_Reg2);

Comparator CMP(Parallel_out_Reg2, Parallel_out_Reg1,lt, gt);

MUX_8bit MUX8(S1, Parallel_out_Reg1, Parallel_out_Reg2, Write_DATA);

Memory MEM(clk, rd, wr, address, Write_DATA,Read_DATA);

endmodule

