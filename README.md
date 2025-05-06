# Serial Communication Protocols

This repository provides an overview and implementation examples of popular **Serial Communication Protocols** used in embedded systems and digital electronics.

---

## 📦 Protocols Covered

- **UART (Universal Asynchronous Receiver Transmitter)**
- **SPI (Serial Peripheral Interface)**
- **I2C (Inter-Integrated Circuit)**

Each protocol includes:
- Block and timing diagrams  
- Verilog or C implementations  
- Simulation testbenches  
- Notes on hardware interfacing (optional)

---

## 🔧 Folder Structure

<pre>
serial-communication-protocols/
├── uart/
│   ├── uart_tx.v
│   ├── uart_rx.v
│   ├── testbench/
│   └── README.md
├── spi/
│   ├── spi_master.v
│   ├── spi_slave.v
│   ├── testbench/
│   └── README.md
├── i2c/
│   ├── i2c_master.v
│   ├── i2c_slave.v
│   ├── testbench/
│   └── README.md
└── docs/
    ├── diagrams/
    ├── timing/
    └── datasheets/
</pre>

---

## 💡 Key Concepts

### UART
- Asynchronous protocol
- Uses start/stop bits
- No clock line required

### SPI
- Synchronous protocol
- Full-duplex communication
- Uses MISO, MOSI, SCLK, and SS lines

### I2C
- Synchronous, half-duplex
- Uses SDA (data) and SCL (clock)
- Supports multi-master and multi-slave

---

## 🧪 Simulation & Testing

- Simulated using **ModelSim** and **Quartus Prime**
- Testbenches provided
- Functional and timing verification

---

## 📁 Requirements

- Verilog/SystemVerilog support  
- Intel Quartus Prime (Lite or Standard)  
- ModelSim or compatible simulator  
- (Optional) FPGA development board

---

## 🛠️ Setup

```bash
git clone https://github.com/your-username/serial-communication-protocols.git
cd serial-communication-protocols
```

## Author

- Anikait Sarkar
- RSA SEIP VLSI Trainee
