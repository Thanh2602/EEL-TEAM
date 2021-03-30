module floattoint(in_float,out_int);

input [31:0] in_float;
output [7:0] out_int;

wire [7:0] exponent;

assign exponent = in_float[30:23] - 8'd127;

assign out_int = (exponent == 8'd7) ? {1'd1,in_float[22:16]} :
                 (exponent == 8'd6) ? {2'd1,in_float[22:17]} :
					  (exponent == 8'd5) ? {3'd1,in_float[22:18]} :
					  (exponent == 8'd4) ? {4'd1,in_float[22:19]} :
					  (exponent == 8'd3) ? {5'd1,in_float[22:20]} :
					  (exponent == 8'd2) ? {6'd1,in_float[22:21]} :
					  (exponent == 8'd1) ? {7'd1,in_float[22]} : 8'd0;
endmodule
