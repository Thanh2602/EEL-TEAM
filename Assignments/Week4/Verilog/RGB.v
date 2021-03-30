module RGB(r_data,g_data,b_data,Signal_in,Signal_out,Out_data,Clk);

input [7:0]r_data,g_data,b_data;
input Signal_in,Clk;
output [7:0]Out_data;
output Signal_out;

wire [31:0]mul1,mul2,mul3,add1,add2,r_data_inreg,g_data_inreg,b_data_inreg,r_data_inmul,g_data_inmul,b_data_inmul;
wire [31:0]a,b,c;
wire [7:0]in_data_reg4;

assign a = 32'b00111110100111100000000011010010;
assign b = 32'b00111111000111000000000110100011;
assign c = 32'b00111101101001111110111110011110;

inttofloat i1(.in_int(r_data),
              .out_float(r_data_inreg)
				  );
				  
inttofloat i2(.in_int(g_data),
              .out_float(g_data_inreg)
				  );
				  
inttofloat i3(.in_int(b_data),
              .out_float(b_data_inreg)
				  );
				  
RF r1(.clk(Clk),
      .in_data(r_data_inreg),
		.out_data(r_data_inmul),
		.signal(Signal_in)
		);
RF r2(.clk(Clk),
      .in_data(g_data_inreg),
		.out_data(g_data_inmul),
		.signal(Signal_in)
		);
RF r3(.clk(Clk),
      .in_data(b_data_inreg),
		.out_data(b_data_inmul),
		.signal(Signal_in)
		);
mul_float m1(.ina(r_data_inmul),
             .inb(a),
				     .out2(mul1)
				 );
mul_float m2(.ina(g_data_inmul),
             .inb(b),
				 .out2(mul2)
				 );
mul_float m3(.ina(b_data_inmul),
             .inb(c),
				 .out2(mul3)
				 );
cong_32bit c1(.a(mul1),
              .b(mul2),
				  .out(add1)
				  );
cong_32bit c2(.a(add1),
              .b(mul3),
				  .out(add2)
				  );
floattoint f1(.in_float(add2),
              .out_int(in_data_reg4)
				  );
RF_out r4(.clk(Clk),
			 .in_data(in_data_reg4),
			 .out_data(Out_data),
			 .signal_out(Signal_out)
			 );
endmodule