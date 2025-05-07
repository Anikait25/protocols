# UART (Universal Asynchronous Receiver/Transmitter)

This repository provides a complete implementation of a UART module for asynchronous serial communication. UART is commonly used in embedded systems and digital communication due to its simplicity and effectiveness.

## 🔧 Features

- Asynchronous serial communication
- Configurable baud rate
- 8-bit data transmission
- 1 start bit and 1 stop bit
- Optional parity bit (based on configuration)
- Separate Transmitter (TX) and Receiver (RX) modules
- Testbench for simulation and verification

## 🧱 Module Overview

### UART Transmitter (TX)

- Takes parallel 8-bit input data
- Adds start and stop bits
- Shifts out data serially based on baud rate

### UART Receiver (RX)

- Detects start bit
- Samples serial input data
- Reconstructs 8-bit parallel output
- Checks stop bit and optional parity

## ⚙️ Configurable Parameters

| Parameter      | Description                     | Example       |
|----------------|----------------------------------|---------------|
| `CLK_FREQ`     | System clock frequency          | 50_000_000 Hz |
| `BAUD_RATE`    | UART baud rate                  | 9600          |
| `DATA_BITS`    | Number of data bits             | 8             |
| `PARITY`       | Parity type (NONE, EVEN, ODD)   | NONE          |

## 📦 File Structure

All files can be placed in a flat structure like:

- `uart_tx.v` – Transmitter module  
- `uart_rx.v` – Receiver module  
- `uart_tb.v` – Testbench module  
- `README.md` – Documentation (this file)

## 🚀 How to Simulate

### Using Icarus Verilog

```bash
iverilog -o uart_tb uart_tb.v uart_tx.v uart_rx.v
vvp uart_tb
```

## Author

- Anikait Sarkar
- RSA SEIP VLSI Trainee
