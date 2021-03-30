module RF(clk,in_data,out_data,signal);

input clk,signal;
input [31:0]in_data;
output reg [31:0]out_data;

always @(posedge clk) begin
if(signal == 1) begin
	out_data = in_data;
	end
end
endmodule