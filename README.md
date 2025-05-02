# I2C Master-Slave Communication System (Verilog)

This repository contains a Verilog implementation of a simple I2C (Inter-Integrated Circuit) communication system. The project includes the core I2C master-slave peripheral, clock divider, and a testbench for simulation.

## Files Overview

- `I2C_clk_divider.v`:  
  Implements a clock divider module to generate a slower clock signal (SCL) for I2C communication.

- `I2C_peripheral.v`:  
  Represents the I2C slave peripheral logic. It handles receiving and responding to signals from the master.

- `I2C_revised_step1.v`:  
  Contains the I2C master logic that initiates communication with the slave using start/stop conditions and data transmission.

- `I2C_revised_step1_tb.v`:  
  Testbench for simulating the I2C master and slave interaction. Verifies data transfer and control signaling using ModelSim or any Verilog simulator.

## Features

- Simulates a basic I2C protocol interface using Verilog.
- Custom clock division for generating the I2C clock.
- Start, Stop, Read, Write operations included.
- Testbench validates core functionality.

## How to Run

1. **Simulation:**
   - Use [ModelSim](https://www.intel.com/content/www/us/en/software/programmable/quartus-prime/model-sim.html) or any other Verilog simulator.
   - Compile all `.v` files including the testbench:
     ```bash
     vlog I2C_clk_divider.v I2C_peripheral.v I2C_revised_step1.v I2C_revised_step1_tb.v
     vsim work.I2C_revised_step1_tb
     ```
   - Run the simulation and inspect waveforms to verify proper I2C behavior.

2. **FPGA Synthesis (Optional):**
   - Can be synthesized using Intel Quartus Prime Lite for FPGAs like Intel MAX10 (10M50DAF484C7G).

## Project Requirements

- Verilog HDL
- ModelSim / QuestaSim for simulation
- (Optional) Intel Quartus Prime Lite for FPGA deployment


## License

This project is open-source and available under the [MIT License](LICENSE).

## Author

- Anikait Sarkar
- RSA SEIP VLSI Trainee
