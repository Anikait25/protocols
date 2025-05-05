module UART_receiver_tb;
reg clk,enable,start;
reg rx_in;
wire [7:0] received_data;

UART_receiver receive(clk,enable,start,rx_in,received_data);

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
	#10;
	
	rx_in = 0;#10;
	rx_in = 1;#10;
	rx_in = 1;#10;
	rx_in = 0;#10;
	rx_in = 0;#10;
	rx_in = 1;#10;
	rx_in = 0;#10;
	rx_in = 0;#10;
	rx_in = 1;#10;
	rx_in = 0;#10;
	rx_in = 0;#10;
	
	#200;
	
	$stop;
end

initial
$monitor($time ,"\tstates = %d",receive.state);
endmodule