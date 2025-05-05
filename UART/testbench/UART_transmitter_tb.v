module UART_transmitter_tb;
reg clk,enable,start;
reg [7:0] data_in;
wire tx_out;

UART_transmitter transmit(clk,enable,start,data_in,tx_out);

initial
clk = 0;
always #5 clk = ~clk;

initial
begin
	enable = 1;
	start = 0;
	data_in = 8'b1100_1001;
	#10;
	
	enable = 0;
	start = 1;
	
	#200;
	
	$stop;
end

initial
$monitor($time ,"\ttx_out = %b\tstates = %d",tx_out,transmit.state);
endmodule