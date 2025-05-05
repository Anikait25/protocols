`timescale 1ns/1ps

module I2C_multiple_slaves;
reg clk,reset;
reg [6:0] addr;
reg [7:0] data;
wire i2c_sda;
wire i2c_scl;

I2C_controller master(.clk(clk),.reset(reset),.addr(addr),.data(data),.i2c_sda(i2c_sda),.i2c_scl(i2c_scl));
I2C_peripheral1 slave1(.i2c_sda(i2c_sda),.i2c_scl(i2c_scl));
I2C_peripheral2 slave2(.i2c_sda(i2c_sda),.i2c_scl(i2c_scl));
I2C_peripheral3 slave3(.i2c_sda(i2c_sda),.i2c_scl(i2c_scl));
initial
clk = 0;
always #5 clk = ~clk;

initial
begin
	reset = 1;
	#1000;
	
	reset = 0;
	addr = 7'b0101_010;
	data = 8'b1010_1010;
	#16000;
	
	reset = 1;
	#1000;
	
	reset = 0;
	addr = 7'b1001_001;
	data = 8'b0110_0110;
	#16000;
	
	reset = 1;
	#1000;
	
	reset = 0;
	addr = 7'b0101_111;
	data = 8'b1001_1001;
	#16000;
	
	$stop;
end
endmodule
