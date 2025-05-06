# 🔄 SPI Single Master-Slave Communication (Verilog)

This project implements a basic **SPI (Serial Peripheral Interface)** system using Verilog HDL, featuring one master and one slave device. It includes a top-level integration module and a testbench for simulation and verification.

---

## 📁 File Overview

| File                        | Description |
|-----------------------------|-------------|
| `spi_top.v`                 | Top-level module integrating master and slave |
| `SPI_single_master_slave.v`| SPI master module |
| `slave.v`                   | SPI slave module |
| `SPI_single_master_slave_tb.v` | Testbench for simulating SPI data exchange |

---

## ⚙️ Features

- Full-duplex communication  
- Single master and single slave interface  
- Handles MOSI, MISO, SCLK, and SS signals  
- Clocked synchronous data transfer  
- Testbench demonstrates master-slave data exchange

---

## 🧪 Simulation Instructions

**Tool Used:** ModelSim / QuestaSim

```bash
vlog SPI_single_master_slave.v
vlog slave.v
vlog spi_top.v
vlog SPI_single_master_slave_tb.v
vsim work.SPI_single_master_slave_tb
run -all
```

✅ Simulation outputs show synchronous data transfer between master and slave on rising/falling edges of SCLK, with proper chip-select control.

---

## 🔌 SPI Signal Lines

- **MOSI** (Master Out, Slave In)  
- **MISO** (Master In, Slave Out)  
- **SCLK** (Serial Clock from master)  
- **SS** (Slave Select, active low)

---

## 📄 License

This project is open-source under the [MIT License](LICENSE).

---

## 👨‍💻 Author

- Anikait Sarkar
- RSA SEIP VLSI Trainee
