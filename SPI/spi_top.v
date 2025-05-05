module spi_top(spi_clk,reset,miso,mosi,spi_scl,spi_cs);
input spi_clk,reset;
output miso;
output mosi;
output spi_scl,spi_cs;

SPI_single_master_slave master(
	.spi_clk(spi_clk),
	.reset(reset),
	.miso(miso),
	.mosi(mosi),
	.spi_scl(spi_scl),
	.spi_cs(spi_cs)
);

slave slave1(
	.spi_scl(spi_scl),
	.spi_cs(spi_cs),
	.mosi(mosi),
	.miso(miso)
);
endmodule