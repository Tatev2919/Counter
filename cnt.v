module cnt (out, out_pulse, clk ,rst,en);
  output reg [7:0] out;
  output reg out_pulse;
  input clk,rst,en;
  
  reg out_pulse_r,tmp_r;
  
  always @(*)
    begin 
      if(rst)
        out_pulse = 0;
      if(out == 8'd200 ) begin
          out_pulse = 1'b1;
      end
       out_pulse_r = out_pulse;
       out_pulse = (~tmp_r)&out_pulse;
       
    end
  
  always @(posedge clk or posedge rst)
    begin 
      if (rst)
        begin 
            tmp_r <= 1'b0;
            out <= 8'h00;
        end
      else 
        begin 
        tmp_r <= out_pulse_r;
        if(en)
           begin 
             out <= out + 1'b1; 
           end
        end
    end
endmodule 