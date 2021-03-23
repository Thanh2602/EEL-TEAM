module cong_32bit(a,b,out);

input [31:0] a,b;
output reg [31:0] out;
//output reg [7:0] out_fa2,out_fb2;
//output reg [24:0] out_sum;

wire [7:0] ea,eb,number,mu;
wire [23:0] fa,fb;
reg [24:0] sum;
reg [23:0] fa2,fb2;


assign ea = a[30:23]   ;
assign eb = b[30:23] ;
assign number = (ea > eb) ? ea-eb : eb-ea;
assign mu = (ea > eb) ? ea  : eb ;


assign fa[22:0] = a[22:0];
assign fa[23] = 1'b1;
assign fb[22:0] = b[22:0];
assign fb[23] = 1'b1;




always@ (*)
begin
		//Dua ve cho cung so E
		if (ea > eb)
			begin
				fb2 = fb >> number;
				fa2 = fa;
			end
		else 
			begin
				fa2 = fa >> number;
				fb2 = fb;		
			end
		
		
		//out_fa2 = number;
		//out_fb2 = mu;
		
		//Neu 2 so cung dau S
		if (a[31] == b[31])
			begin
				sum = fa2 + fb2 ;	
				out[31] = a[31] ;	
			end		
		else	// Neu hai so khac dau S
			begin
				if(fa2 > fb2)
					begin
						sum = fa2 - fb2 ;
						out[31] = a[31];
					end
				else
					begin
						sum = fb2 - fa2;
						out[31] = b[31];
				   end
				
			end
			//normalise ket qua, check overflow
			if(sum[24] == 1)
				begin
					out[22:0] = sum[23:1];
					out[30:23] = mu  + 8'd1 ; 
				end
			else if(sum[23] == 1 )
				begin
					out[22:0] = sum[22:0];
					out[30:23] = mu  ; 
				end
			else if(sum[22] == 1 )
				begin
					out[22:0] = {sum[21:0],1'd0};
					out[30:23] = mu - 8'd1; 
				end
				
				
			else if(sum[21] == 1 )
				begin
					out[22:0] = {sum[20:0],2'd0};
					out[30:23] = mu - 8'd2; 
				end
			else if(sum[20] == 1 )
				begin
					out[22:0] = {sum[19:0],3'd0};
					out[30:23] = mu - 8'd3; 
				end
			else if(sum[19] == 1 )
				begin
					out[22:0] = {sum[18:0],4'd0};
					out[30:23] = mu - 8'd4; 
				end
			else if(sum[18] == 1 )
				begin
					out[22:0] = {sum[17:0],5'd0};
					out[30:23] = mu - 8'd5; 
				end
			else if(sum[17] == 1 )
				begin
					out[22:0] = {sum[16:0],6'd0};
					out[30:23] = mu - 8'd6; 
				end
			else if(sum[16] == 1 )
				begin
					out[22:0] = {sum[15:0],7'd0};
					out[30:23] = mu - 8'd7; 
				end
			else if(sum[15] == 1 )
				begin
					out[22:0] = {sum[14:0],8'd0};
					out[30:23] = mu - 8'd8; 
				end
			else if(sum[14] == 1 )
				begin
					out[22:0] = {sum[13:0],9'd0};
					out[30:23] = mu - 8'd9; 
				end
			else if(sum[13] == 1 )
				begin
					out[22:0] = {sum[12:0],10'd0};
					out[30:23] = mu - 8'd10; 
				end
			else if(sum[12] == 1 )
				begin
					out[22:0] = {sum[11:0],11'd0};
					out[30:23] = mu - 8'd11; 
				end
			else if(sum[11] == 1 )
				begin
					out[22:0] = {sum[10:0],12'd0};
					out[30:23] = mu - 8'd12; 
				end
			else if(sum[10] == 1 )
				begin
					out[22:0] = {sum[9:0],13'd0};
					out[30:23] = mu - 8'd13; 
				end
			else if(sum[9] == 1 )
				begin
					out[22:0] = {sum[8:0],14'd0};
					out[30:23] = mu - 8'd14; 
				end
			else if(sum[8] == 1 )
				begin
					out[22:0] = {sum[7:0],15'd0};
					out[30:23] = mu - 8'd15; 
				end
			else if(sum[7] == 1 )
				begin
					out[22:0] = {sum[6:0],16'd0};
					out[30:23] = mu - 8'd16; 
				end
			else if(sum[6] == 1 )
				begin
					out[22:0] = {sum[5:0],17'd0};
					out[30:23] = mu - 8'd17; 
				end
			else if(sum[5] == 1 )
				begin
					out[22:0] = {sum[4:0],18'd0};
					out[30:23] = mu - 8'd18; 
				end
			else if(sum[4] == 1 )
				begin
					out[22:0] = {sum[3:0],19'd0};
					out[30:23] = mu - 8'd19; 
				end
			else if(sum[3] == 1 )
				begin
					out[22:0] = {sum[2:0],20'd0};
					out[30:23] = mu - 8'd20; 
				end
			else if(sum[2] == 1 )
				begin
					out[22:0] = {sum[1:0],21'd0};
					out[30:23] = mu - 8'd21; 
				end
			else if(sum[1] == 1 )
				begin
					out[22:0] = {sum[0],22'd0};
					out[30:23] = mu - 8'd22; 
				end
			else if(sum[0] == 1 )
				begin
					out[22:0] = {23'd0};
					out[30:23] = mu - 8'd23; 
				end
			else out[30:0] = 31'b0;
			
				
	
		//out_sum=sum;

			
	
end



endmodule

