
`timescale 1ns/1ns


module rom_8B
#(parameter WIDTH= 8,
  parameter DEPTH= 8,
  parameter ADDR_WIDTH= $clog2(DEPTH))(
output  reg [WIDTH-1:0] data_out,
input clk,
input reset,
input chip_sel,
input read_ena,
input [ADDR_WIDTH-1:0] address);

reg [WIDTH-1:0] memory [0:DEPTH-1];


initial begin
	memory[0]<=8'b00000001;
	memory[1]<=8'b00000010;
	memory[2]<=8'b00000100;
	memory[3]<=8'b00001000;
	memory[4]<=8'b00010000;
	memory[5]<=8'b00100000;
	memory[6]<=8'b01000000;
	memory[7]<=8'b10000000;
end

always@(posedge clk) begin
	if(reset) 
		data_out<=0;
	else begin
		if(chip_sel & read_ena)
			data_out<=memory[address];
		else data_out<=0;
	end
end

endmodule


