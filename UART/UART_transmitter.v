module UART_transmitter(clk,enable,start,data_in,tx_out);
input clk,enable,start;
input [7:0] data_in;
output reg tx_out;

reg [1:0] state = 0;
reg [7:0] saved_data = 0;
reg [10:0] data_send = 0; //start bit + data + parity + stop bit
reg [4:0] count;
wire parity;

assign parity = ^data_in;

localparam IDLE = 0;
localparam START = 1;
localparam SEND_DATA = 2;
localparam END = 3;

always@(posedge clk)
begin
	if(enable)
	begin
		count <= 0;
		data_send <= 0;
		tx_out <= 1;
		state <= IDLE;
	end
	else
	begin
		case(state)
			IDLE:
				begin
					if(start) begin
						tx_out <= 1;
						count <= 4'd10;
						state <= START;
					end
					else begin
						state <= IDLE;
						end
				end
			START:
				begin
					data_send <= {1'b0,data_in,parity,1'b1};
					state <= SEND_DATA;
				end
			SEND_DATA:
				begin
					tx_out <= data_send[count];
					if(count == 0) state <= END;
					else count <= count - 1;
				end
			END:
				begin
					state <= IDLE;
				end
		endcase
	end
end

endmodule