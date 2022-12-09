module OP(
	input clk,
	output led
);
	reg [15:0] cnt_1kHz;
	reg pulse_1kHz;
	reg [7:0] pwm_width;
	reg side;
	initial begin
		side = 1;
		pwm_width = 1;
	end
	
	PWM ledpwm(clk, pwm_width, led);
	
	always @ (posedge clk) begin
		if(cnt_1kHz == 50000) begin
			cnt_1kHz <= 0;
		end else begin
			cnt_1kHz <= cnt_1kHz + 1;
		end
		pulse_1kHz <= (cnt_1kHz == 0);
	end
	
	always @ (posedge pulse_1kHz) begin
		if(pwm_width == 0) begin
			side <= 1;
			pwm_width <= 1;
		end else begin
			if(pwm_width == 255) begin
				side <= 0;
				pwm_width <= 254;
			end else begin
				if(side) begin
					pwm_width = pwm_width + 1;
				end else begin
					pwm_width = pwm_width - 1;
				end
			end
		end
	end
endmodule