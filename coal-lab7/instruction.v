module i_mem (clk,reset,addr,rdata);

input clk, reset;
input[31:0] addr;
output [31:0] rdata;


reg [31:0] mem [1023:0];

initial begin
  mem[0] <= 32'h00123405;

end


assign rdata = (reset == 1'b0) ? 32'h00000000 :mem [addr[31:2]]; 

endmodule