module cnt_tb;
  reg clk;
  reg reset;
  reg en;
  wire out_pulse;
  wire[7:0] out;
  cnt c1(out,out_pulse,clk, reset,en);
  
  initial begin 
    $dumpfile("wv.vcd");
    $dumpvars();
  end
  initial
    begin 
	clk = 1'b0;
    end
  
  always 
	#5 clk = ~clk;
  
  initial begin
      reset = 1'b1;
      en = 1'b0;
      repeat (3) @(negedge clk);
      reset = 1'b0;
      en = 1'b1;
      repeat (198) @(posedge clk);
      #22;
      en = 1'b0;
      repeat (10) @(negedge clk);
      en = 1'b1;
      repeat (300) @(posedge clk);
      #21;
      en = 1'b0;
      #500;
      $finish;
    end
endmodule
  
 