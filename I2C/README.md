# 🧠 I2C Master-Slave Communication (Verilog)

This project implements a basic **I2C (Inter-Integrated Circuit)** protocol using Verilog HDL, including both **master** and **slave (peripheral)** logic. It also includes a clock divider and a testbench for simulation and validation.

---

## 📁 File Overview

| File                        | Description |
|-----------------------------|-------------|
| `I2C_clk_divider.v`         | Clock divider module to generate SCL from system clock |
| `I2C_revised_step1.v`       | I2C Master controller logic |
| `I2C_revised_peripheral.v`  | I2C Slave (Peripheral) logic |
| `I2C_revised_step1_tb.v`    | Testbench for verifying Master-Slave communication |

---

## 🔧 Features

- Generates I2C SCL using clock divider  
- Master transmit operation  
- Simple slave device responds to address and data  
- Verilog testbench for simulation  
- Compatible with ModelSim/QuestaSim

---

## 🔄 Communication Flow

1. **Master** initiates with START condition  
2. Sends 7-bit address + R/W bit  
3. **Slave** acknowledges  
4. Data is sent from Master to Slave  
5. STOP condition ends the transmission

---

## 🧪 Simulation Instructions

**Tool Used:** ModelSim / QuestaSim

```bash
vlog I2C_clk_divider.v
vlog I2C_revised_step1.v
vlog I2C_revised_peripheral.v
vlog I2C_revised_step1_tb.v
vsim work.I2C_revised_step1_tb
run -all
```

✅ You should see the interaction of SDA and SCL lines with correct START, ADDRESS, ACK, DATA, and STOP timing.

---

## 📘 Protocol Notes

- **SDA**: Serial Data Line (bidirectional)  
- **SCL**: Serial Clock Line (master-driven)  
- Standard I2C sequences: START → ADDRESS → DATA → STOP  
- Clock divider helps maintain correct I2C frequency (e.g., 100kHz or 400kHz)

---

## 📄 License

This project is open-source under the [MIT License](LICENSE).

---

## 👨‍💻 Author

- Anikait Sarkar
- RSA SEIP VLSI Trainee
