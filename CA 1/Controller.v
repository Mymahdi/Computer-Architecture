`timescale 1ns/1ns

`define Idle 4'b0000
`define Init 4'b0001
`define DS1 4'b0010
`define Load_C2 4'b0011
`define DS2 4'b0100
`define Inc_C1 4'b0101
`define Load_Reg1 4'b0110
`define Load_Reg2 4'b0111
`define DS3 4'b1000
`define Write_Reg2 4'b1001
`define Wrire_Reg1 4'b1010
`define Inc_C2 4'b1011
`define Done 4'b1100

module Controller(start, rst, clk, CO1, CO2, lt, gt, C1_clr, C2_clr, C1_ld, C2_ld, C1_inc, C2_inc, S0, S1, Reg1_ld, Reg2_ld, rd, wr, done);

input start, rst, clk, CO1, CO2, lt, gt;
output C1_clr, C2_clr, C1_ld, C2_ld, C1_inc, C2_inc, S0, S1, Reg1_ld, Reg2_ld, rd, wr, done;
reg C1_clr, C2_clr, C1_ld, C2_ld, C1_inc, C2_inc, S0, S1, Reg1_ld, Reg2_ld, rd, wr, done;

reg [3:0] ps;
reg [3:0] ns;

always @(posedge clk) begin
    if (rst)
        ps = 4'b0000;
    else
        ps = ns;
end

always @(ps or start or CO1 or CO2 or lt or gt) begin
    case (ps)
        `Idle: ns = start?`Init:`Idle;
        `Init: ns = `DS1;
        `DS1: ns = CO1?`Done:`Load_C2;
        `Load_C2: ns = `DS2;
        `DS2: ns = CO2?`Inc_C1:`Load_Reg1;
        `Inc_C1: ns = `DS1;
        `Load_Reg1: ns = `Load_Reg2;
        `Load_Reg2: ns = `DS3;
        `DS3: ns = lt?`Write_Reg2:`Inc_C2;
        `Write_Reg2: ns = `Wrire_Reg1;
        `Wrire_Reg1: ns = `Inc_C2;
        `Inc_C2: ns = `DS2;
        `Done: ns = `Idle;
        default:ps = 4'b0000;
    endcase
end

always @(ps) begin
    {C1_clr, C2_clr, C1_ld, C2_ld, C1_inc, C2_inc, S0, S1, Reg1_ld, Reg2_ld, rd, wr, done} = 13'b0;
    case (ps)
        `Idle:;
        `Init: C1_clr = 1'b1;
        `DS1:;
        `Load_C2: C2_ld = 1'b1;
        `DS2:;
        `Inc_C1: C1_inc = 1'b1;
        `Load_Reg1: {S0, rd, Reg1_ld} = 3'b011;
        `Load_Reg2: {S0, rd, Reg2_ld} = 3'b111;
        `DS3:;
        `Write_Reg2: {S0, S1, wr} = 3'b011;
        `Wrire_Reg1: {S0, S1, wr} = 3'b101;
        `Inc_C2: C2_inc = 1'b1;
        `Done: done = 1'b1; 
	default:ps = 4'b0000;
    endcase
end

endmodule

