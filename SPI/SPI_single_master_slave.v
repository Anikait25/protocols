module SPI_single_master_slave(spi_clk,reset,miso,mosi,spi_scl,spi_cs);
input spi_clk,reset;
input miso;
output spi_scl;
output reg spi_cs;
output reg mosi;

reg [7:0]data = 8'b1100_1011;
reg [7:0]rx_data;
reg [7:0]count;
reg [7:0]state;
localparam IDLE = 0;
localparam START = 1;
localparam SEND_N_RECEIVE_DATA = 2;
localparam STOP = 3;

reg spi_scl_enable;

assign spi_scl = (spi_scl_enable == 1)? spi_clk : 1;
//$monitor("%b,%b",spi_scl_enable,spi_scl);

always@(posedge spi_clk) //for SPI Serial Clock
begin
	if(reset == 1)
	begin
		spi_scl_enable <= 0;
	end
	else
	begin
		if((state == IDLE) || (state == START) || (state == STOP))
		begin
			spi_scl_enable <= 0;
		end
		else begin
			spi_scl_enable <= 1;
		end
	end
end

//FSM logic
always@(posedge spi_clk) begin
	if(reset == 1) begin
		spi_cs <= 1;
		state <= IDLE;
	end
	else begin
		case(state)
			IDLE:
			begin
				spi_cs <= 0;
				mosi <= 1;
				state <= START; 
			end
			
			START:
			begin
				count <= 8'd7;
				state <= SEND_N_RECEIVE_DATA;
			end
			
			SEND_N_RECEIVE_DATA:
			begin
				mosi <= data[count];
				rx_data[count] <= miso; 
				if(count == 0) state <= STOP;
				else count <= count - 1;
			end
			
			STOP:
			begin
				spi_cs <= 1;
				mosi <= 1;
				state <= IDLE;
			end
			default:state <= IDLE;
		endcase
	end
end
endmodule
