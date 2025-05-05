module I2C_clk_divider(ref_clk,i2c_clk);
input ref_clk;
output reg i2c_clk=0;

parameter DELAY =1000;

reg [9:0] count = 0;

always@(posedge ref_clk) begin
	if(count == (DELAY/2)) begin
		i2c_clk = ~i2c_clk;
		count = 0;
	end
	else begin
		count = count + 1;
	end
end

endmodule