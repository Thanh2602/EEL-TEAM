module inttofloat(in_int,out_float);

input [7:0]in_int;
output [31:0]out_float;

wire [7:0]exponent;
wire [22:0]mantissa;

assign {exponent,mantissa} = (in_int[7] == 1'b1) ? {8'd7,{in_int[6:0],16'd0}} :
                             (in_int[6] == 1'b1) ? {8'd6,{in_int[5:0],17'd0}} :
                             (in_int[5] == 1'b1) ? {8'd5,{in_int[4:0],18'd0}} :
									  (in_int[4] == 1'b1) ? {8'd4,{in_int[3:0],19'd0}} :
									  (in_int[3] == 1'b1) ? {8'd3,{in_int[2:0],20'd0}} :
									  (in_int[2] == 1'b1) ? {8'd2,{in_int[1:0],21'd0}} :
									  (in_int[1] == 1'b1) ? {8'd1,{in_int[0],22'd0}} : {8'd0,23'd0};
assign out_float[31] = 1'b0;
assign out_float[30:23] = (in_int == 8'd0) ? 8'd0 : exponent + 8'd127;
assign out_float[22:0] = (in_int == 8'd0) ? 23'd0 : mantissa; 
endmodule