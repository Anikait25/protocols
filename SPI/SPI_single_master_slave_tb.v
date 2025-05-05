module SPI_single_master_slave_tb;
reg spi_clk,reset;
wire miso;
wire mosi;
wire spi_scl,spi_cs;

spi_top controller(
	.spi_clk(spi_clk),
	.reset(reset),
	.miso(miso),
	.mosi(mosi),
	.spi_scl(spi_scl),
	.spi_cs(spi_cs)
);



initial
spi_clk = 0;
always #5 spi_clk = ~spi_clk;
initial
begin
	reset=1;
	
	#10;
	
	reset = 0;
	
	
	#100;

	$stop;
end
endmodule