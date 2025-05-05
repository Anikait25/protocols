module I2C_controller (clk,reset,addr,data,i2c_sda,i2c_scl);
input clk,reset;
input [6:0] addr;
input [7:0] data;
inout i2c_sda;
output i2c_scl;

// GOAL:- To write the address, and data .

localparam STATE_IDLE = 0;
localparam STATE_START = 1;
localparam STATE_ADDR = 2;
localparam STATE_RW = 3;
localparam STATE_WACK = 4;
localparam STATE_DATA = 5;
localparam STATE_WACK2 = 6;
localparam STATE_STOP = 7;

reg [7:0] state;
reg [7:0] count;
reg i2c_scl_enable =0;
reg i2c_sda_temp;

assign i2c_scl = (i2c_scl_enable == 0) ? 1 : ~clk;// should act like a clock and stretched when needed

always@(negedge clk) begin // only to be active on certain occasions
	if(reset == 1) begin
		i2c_scl_enable <= 0;
	end 
	else begin
		if((state == STATE_IDLE) || (state == STATE_START) || (state == STATE_STOP)) begin
			i2c_scl_enable <= 0;
		end
		else begin
			i2c_scl_enable <= 1;
		end
	end
end


always@(posedge clk) begin //FSM 
	if(reset == 1) begin
		state <= 0;
		i2c_sda_temp <= 1;
		count <= 8'd0;
	end 
	else begin
		case(state)
			STATE_IDLE: begin // idle
				i2c_sda_temp <= 1;
				state <= STATE_START;
			end
			STATE_START: begin // start
				i2c_sda_temp <= 0;
				state <= STATE_ADDR;
				count <= 6;
			end
			STATE_ADDR: begin //msb address bit
				i2c_sda_temp <= addr[count];
				if(count==0) state <= STATE_RW;
				else count <= count - 1;
			end
			STATE_RW: begin // Write bit
				i2c_sda_temp <= 1;
				state <= STATE_WACK;
			end
			STATE_WACK: begin // acknowledgement
				state <= STATE_DATA;
				count <= 7;
			end
			STATE_DATA: begin // data sent
				i2c_sda_temp <= data[count];
				if (count == 0) state <= STATE_WACK2;
				else count <= count - 1;
			end
			STATE_WACK2: begin // data received acknowledgement
				state <= STATE_STOP;
			end
			STATE_STOP: begin // stop or terminate
				i2c_sda_temp <= 1;
				state <= STATE_IDLE;
			end
		endcase
	end
end
assign i2c_sda = i2c_sda_temp;
endmodule