module PWM(
	input clk,
	input [7:0] width,
	output reg out
);
	reg [7:0] idx;
	initial begin
		idx <= 0;
	end
	always @ (posedge clk) begin
		idx <= idx + 1;
		if(idx < width) begin
			out <= 1;
		end else begin
			out <= 0;
		end
	end
endmodule