module mul_float(ina,inb,out2);

input [31:0]ina,inb;
output [31:0]out2;
wire [31:0]out;
wire [5:0]signal_out;

adder8bit a1(.ExponentA(ina[30:23]),
             .ExponentB(inb[30:23]),
				 .OutAdder(out[30:23]),
				 .signal(signal_out)
				 );

Multiplication_24bit m1(.MantissasA(ina[22:0]),
                        .MantissasB(inb[22:0]),
								.outmul(out[22:0]),
								.signalout(signal_out));
assign out[31] = ina[31] ^ inb[31];
assign out2 = (ina == 0 | inb == 0) ? 32'd0 : out;
endmodule
