
`timescale 1ns/1ns

module rom_8B_tb
#(parameter WIDTH= 8,
  parameter DEPTH= 8,
  parameter ADDR_WIDTH= $clog2(DEPTH))();

wire [WIDTH-1:0] data_out_tb;
reg clk_tb;
reg reset_tb;
reg chip_sel_tb;
reg read_ena_tb;
reg [ADDR_WIDTH-1:0] address_tb;

rom_8B dut(
.data_out(data_out_tb),
.clk(clk_tb),
.reset(reset_tb),
.chip_sel(chip_sel_tb),
.read_ena(read_ena_tb),
.address(address_tb));

initial begin
	clk_tb<=0;
	forever #5 clk_tb<=~clk_tb;
end


initial begin
	reset_tb<=1;
	#20 reset_tb<=0;
end


initial begin
	chip_sel_tb<=0;
	#50 chip_sel_tb<=1;
end


initial begin
	#55   read_ena_tb<=0;  address_tb<=0;
	#10  read_ena_tb<=1;  address_tb<=3'b000;
	#10  read_ena_tb<=0;  address_tb<=3'b001;
	#10  read_ena_tb<=1;  address_tb<=3'b001;
	#10  read_ena_tb<=0;  address_tb<=3'b010;
	#10  read_ena_tb<=1;  address_tb<=3'b010;
	#10  read_ena_tb<=0;  address_tb<=3'b011;
	#10  read_ena_tb<=1;  address_tb<=3'b011;
	#10  read_ena_tb<=0;  address_tb<=3'b100;
	#10  read_ena_tb<=1;  address_tb<=3'b100;
	#10  read_ena_tb<=0;  address_tb<=3'b101;
	#10  read_ena_tb<=1;  address_tb<=3'b101;
	#10  read_ena_tb<=0;  address_tb<=3'b110;
	#10  read_ena_tb<=1;  address_tb<=3'b110;
	#10  read_ena_tb<=0;  address_tb<=3'b111;
	#10  read_ena_tb<=1;  address_tb<=3'b111;
end


endmodule