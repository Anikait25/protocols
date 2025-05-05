module BAUD_generator_tb;
reg clk;
wire tx_clk,rx_clk;

BAUD_generator BAUD(clk,tx_clk,rx_clk);

initial
clk = 0;
always #5 clk = ~clk;

initial begin
#100000;
$stop;
end

endmodule