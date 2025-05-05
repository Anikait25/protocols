module BAUD_generator(clk,tx_clk,rx_clk);
input clk;
output reg tx_clk = 0;
output reg rx_clk = 0;

parameter clk_rate = 100_000_000;
parameter BAUD_rate = 9600;
parameter divisor_tx = clk_rate/(BAUD_rate * 16); //16x oversampling
parameter divisor_rx = clk_rate/(BAUD_rate * 16); //16x oversampling

parameter rx_cnt_width = $clog2(divisor_rx);
parameter tx_cnt_width = $clog2(divisor_tx);

reg [rx_cnt_width - 1: 0] rx_counter = 0;
reg [tx_cnt_width - 1: 0] tx_counter = 0;


always@(posedge clk) //for receiver side
begin	
	if(rx_counter == divisor_rx - 1)
	begin
		rx_counter <= 0;
		rx_clk <= ~rx_clk;
	end
	else 
		rx_counter <= rx_counter + 1;
end

always@(posedge clk) //for transmitter side
begin
	if(tx_counter == divisor_tx - 1)
	begin
		tx_counter <= 0;
		tx_clk <= ~tx_clk;
	end
	else
		tx_counter <= tx_counter + 1;
end

endmodule