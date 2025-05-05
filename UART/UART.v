module UART(
input clk,enable,start,
output [7:0] received_data
);

wire tx_clk,rx_clk;
wire tx_out;
parameter [7:0]data = 8'b1101_0101;
BAUD_generator BAUD(.clk(clk),.tx_clk(tx_clk),.rx_clk(rx_clk));

UART_transmitter transmit(.clk(tx_clk),.enable(enable),.start(start),.data_in(data),.tx_out(tx_out));

UART_receiver receive(.clk(rx_clk),.enable(enable),.start(start),.rx_in(tx_out),.received_data(received_data));

endmodule
