`include "ALU_Opcodes.vh"
module GCDFSM(
 input isZero,
 input [31:0]result,
 output [3:0] raddr1,
 output [3:0] raddr2,
 output wen,
 output [3:0] waddr,
 output wdsrc,
 output [3:0] func,
 output [31:0] constant,
);
reg [1:0] cs;
reg [1:0] ns;

parameter inicio =2'd0;
parameter ciclo =2'd1;
parameter final =2'd2;

wire [3:0]addr1;
wire [3:0]addr2;


always @(posedge clk) begin
    if(rst)
        cs<=2'd00;
    else
        cs<=ns;
end

GPPM GP(
            .clk(clk),
            .raddr1(radd1),
            .raddr2(raddr2),
            .wen(wen),
            .waddr(waddr)
            .wdsrc(wdsrc),
            .func(func),
            .constant(constant),
       );

endmodule // GCDFSM