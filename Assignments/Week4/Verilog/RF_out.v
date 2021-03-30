module RF_out(clk,in_data,out_data,signal_out);

input clk;
input [7:0]in_data;
output reg [7:0]out_data;
output signal_out;

always @(posedge clk) begin
	out_data = in_data;
end
assign signal_out = (out_data == in_data) ? 1'b1 : 1'b0;
endmodule