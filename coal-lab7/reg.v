module reg_file (clk, reset, RegWrite , A1, A2, A3, Wdata, RD1, RD2 );
input clk, reset;
input  RegWrite;
input[4:0] A1, A2,A3;
input[31:0] Wdata;
output [31:0] RD1, RD2;

//REGFILE

reg [31:0] reg_mem [31:0];

assign RD1 = (reset == 1'b0) ? 32'h0000000 : reg_mem [A1];
assign RD2 = (reset == 1'b0) ? 32'h0000000 : reg_mem [A2];

always@ (negedge clk or negedge reset) begin 

if (reset == 1'b0) begin
   reg_mem [0] <= 32'h0000000;
   end
else  if (RegWrite == 1'b1) begin 
    reg_mem[A3] <= Wdata;
    end
 else begin
    reg_mem <= reg_mem;
 end  
end   


endmodule