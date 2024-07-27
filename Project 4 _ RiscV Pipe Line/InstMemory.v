module InstMemory(rst, a, inst);
    input rst;
    input [15:0] a;
    output reg [31:0] inst;
    wire [31:0] address;
    assign address = {16'b0,a};
    reg [31:0] im [16000:0];
    always @(posedge rst)begin
        $readmemb("C:/Users/AmirAbbasGhadiri/Desktop/Risc_v_pipeline-main/test2.txt", im);
    end

    always @(address)begin
        inst = im[address>>2];
    end
endmodule