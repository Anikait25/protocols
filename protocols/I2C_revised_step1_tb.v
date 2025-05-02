`timescale 1ns/1ps

module I2C_revised_step1_tb;
reg clk,reset;
reg [6:0] addr;
reg [7:0] data;
wire i2c_sda;
wire i2c_scl;

I2C_revised_step1 master(.clk(clk),.reset(reset),.addr(addr),.data(data),.i2c_sda(i2c_sda),.i2c_scl(i2c_scl));
I2C_revised_peripheral slave(.i2c_sda(i2c_sda),.i2c_scl(i2c_scl));

initial
clk = 0;
always #5 clk = ~clk;

initial
begin
	reset = 1;
	#100;
	
	reset = 0;
	addr = 7'b0101_010;
	data = 8'b1010_1010;
	#160000;
	
	$stop;
end
endmodule
