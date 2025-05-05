`timescale 1ns/1ps
module UART_tb;

reg clk,enable,start;
wire [7:0] received_data;

UART uart(clk,enable,start,received_data);

initial
clk = 0;
always #5 clk = ~clk;

initial
begin
	enable = 1;
	start = 0;
	#10;
	enable = 0;
	start = 1;
	#4_000_000;
	$finish;
end
endmodule
