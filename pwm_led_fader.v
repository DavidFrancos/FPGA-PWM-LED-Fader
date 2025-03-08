module pwm_led_fader (
    input wire clk,
    output reg led,
    output reg led_debug
);

reg [7:0] duty_cycle=0;
reg [16:0] fade_counter=0;
reg [7:0] pwm_counter=0;
reg fade_up=1;
always @(posedge clk) begin
    led_debug <= fade_up;
end

always @(posedge clk) begin
    fade_counter <= fade_counter +1;
    pwm_counter <= pwm_counter + 1;
    led <= (pwm_counter < duty_cycle);
    if (fade_counter == 10000) begin
        fade_counter <= 0;
        if (fade_up) duty_cycle <= duty_cycle + 1;
        if (!fade_up) duty_cycle <= duty_cycle -1;
        if (duty_cycle == 254) fade_up <= 0;
        else if (duty_cycle == 1) fade_up <= 1;
    end

end

endmodule