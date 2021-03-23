module RGB(r_data,g_data,b_data,Out_data);

input [31:0]r_data,g_data,b_data;
output [31:0]Out_data;

wire [31:0]mul1,mul2,mul3,add1;
wire [31:0]a,b,c;
assign a = 32'b00111110100111100000000011010010;
assign b = 32'b00111111000111000000000110100011;
assign c = 32'b00111101101001111110111110011110;
mul_float m1(.ina(r_data),
             .inb(a),
				     .out2(mul1)
				 );
mul_float m2(.ina(g_data),
             .inb(b),
				    .out2(mul2)
				 );
mul_float m3(.ina(b_data),
             .inb(c),
				     .out2(mul3)
				 );
cong_32bit c1(.a(mul1),
              .b(mul2),
				      .out(add1)
				  );
cong_32bit c2(.a(add1),
              .b(mul3),
				      .out(Out_data)
				  );
endmodule