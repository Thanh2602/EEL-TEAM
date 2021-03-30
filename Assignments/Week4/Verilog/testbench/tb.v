module tb();
  
reg [7:0]R_data,G_data,B_data;
reg SIGNAL_IN,CLK;
wire [7:0]OUT_data;
wire SIGNAL_OUT;

reg [7:0]a[42435:0];
reg [7:0]b[42435:0];
reg [7:0]c[42435:0];
reg [7:0] Result;
integer i;
initial begin
 #0
   CLK = 0;
   $readmemb("Red10.txt",a);
   $readmemb("Blue10.txt",b);
   $readmemb("Green10.txt",c);
   Result = $fopen("Gray10");
     for(i = 0; i<= 42437; i = i + 1) begin
  #20
       SIGNAL_IN = 1;
       R_data = a[i];
       G_data = c[i];
       B_data = b[i];
    $fdisplay(Result,"%d",OUT_data);
    #60;
    end
    $finish;
end
always @(CLK) #40 CLK <= ~CLK;
RGB r1(.r_data(R_data),
       .g_data(G_data),
       .b_data(B_data),
       .Signal_in(SIGNAL_IN),
       .Signal_out(SIGNAL_OUT),
       .Out_data(OUT_data),
       .Clk(CLK)
       );
endmodule
      