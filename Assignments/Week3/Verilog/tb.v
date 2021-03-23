module tb();
  
reg [31:0]R_data,G_data,B_data;
wire [31:0]OUT_data;

reg [31:0]a[42435:0];
reg [31:0]b[42435:0];
reg [31:0]c[42435:0];
reg [31:0] Result;
integer i;

initial begin
 #0
   $readmemb("Red.txt",a);
   $readmemb("Blue.txt",b);
   $readmemb("Green.txt",c);
   Result = $fopen("Result");
  #4
     for(i = 0; i<= 42436; i = i + 1) begin
       R_data = a[i];
       G_data = c[i];
       B_data = b[i];
    $fdisplay(Result,"%b",OUT_data);
    #60;
    end
    $finish;
end
RGB r1(.r_data(R_data),
       .g_data(G_data),
       .b_data(B_data),
       .Out_data(OUT_data)
       );
endmodule
      