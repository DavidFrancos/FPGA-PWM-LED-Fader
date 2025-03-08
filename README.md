🌟 PWM LED Fader - FPGA Implementation

📌 Project Overview

This FPGA project implements Pulse Width Modulation (PWM) to control the brightness of an LED. By gradually adjusting the duty cycle, the LED smoothly fades in and out, creating a dimming effect.

⚡ Features

✅ PWM-based LED brightness control✅ Adjustable fading speed✅ Fully synthesizable on FPGA✅ Uses Verilog and runs on the iCEBreaker FPGA

📜 Hardware Requirements

🖥️ ICEBreaker FPGA (Lattice iCE40UP5K)

🔴 LED (connected to a PWM output pin)

🕹️ Optional: Button to control speed

🖧 USB for FPGA programming

🛠️ File Structure

FPGA_Projects/
│── pwm_led_fader/
│   ├── pwm_led_fader.v       # Verilog implementation
│   ├── constraints.pcf       # FPGA pin configuration
│   ├── README.md             # Project documentation

💾 Synthesis & Programming (ICEBreaker FPGA)

Use the following commands to synthesize and upload the design:

yosys -p "synth_ice40 -top pwm_led_fader -json pwm_led_fader.json" pwm_led_fader.v
nextpnr-ice40 --up5k --package sg48 --json pwm_led_fader.json --pcf constraints.pcf --asc pwm_led_fader.asc
icepack pwm_led_fader.asc pwm_led_fader.bin
iceprog pwm_led_fader.bin

🔍 How It Works

The system generates a PWM signal to control LED brightness.

The duty cycle gradually increases and decreases, causing the LED to fade in and out.

You can adjust the speed by modifying the counter in the Verilog code.

🚀 Future Improvements

Add button control to adjust brightness manually.

Implement multiple PWM channels for RGB LED fading.

Allow UART control of PWM duty cycle from a PC.

Created by David, inspired by embedded PWM control techniques.
