
# 🗳️ Electronic Voting Machine using Verilog HDL

This repository contains the Verilog HDL implementation of a **Digital Electronic Voting Machine**. The design simulates a simple and secure voting system where multiple candidates receive votes through button inputs, and the final vote count can be displayed after voting ends.

---

## 📌 Project Overview

The **Voting Machine** is designed using **Verilog HDL** to demonstrate the practical application of digital logic, counters, registers, and control logic. This project is suitable for **VLSI beginners**, **FPGA learners**, and **academic mini-projects**.

---

## ⚙️ Features

* Supports **multiple candidates**
* Individual vote counting for each candidate
* Reset functionality
* Prevents multiple votes at the same time
* Result display after voting completion
* Fully synchronous design
* Synthesizable and simulation-friendly

---

## 🧠 Design Concept

* Each candidate has a dedicated **vote counter**
* Button press increments the respective candidate counter
* A clock-driven synchronous logic ensures reliable operation
* Reset clears all vote counts
* Output displays total votes for each candidate

---

## 🧾 Module Description

### Inputs

* `clk` – System clock
* `rst` – Reset signal
* `vote_a`, `vote_b`, `vote_c`, `vote_d` – Vote inputs for candidates

### Outputs

* `count_a`, `count_b`, `count_c`, `count_d` – Vote count outputs

---

## 🧪 Simulation

* Designed and tested using xilinx vivado
* Testbench included for verification
* Waveforms confirm correct vote counting and reset behavior

---

## 📂 Repository Structure

```
Voting-Machine-Verilog/
│
├── src/
│   └── buttoncontrol.v
│
├── tb/
│   └── voting_machine_tb.v
│
├── docs/
│   └── waveform.png
│   └── state_diagram.png
│
└── README.md
```

---

## 🛠️ Tools Used

* Verilog HDL
* xilinx vivado

---

## 🚀 How to Run

1. Clone the repository

   ```bash
   git clone https://github.com/Jeelpatel121-tech/voting-machine-using-verilog.git
   ```
2. Open files in your Verilog simulator
3. Run the testbench
4. Observe waveform outputs

---

## 🎓 Learning Outcomes

* Understanding synchronous digital design
* Practical use of counters and registers
* FSM-free control logic
* Testbench writing and simulation analysis

---

## 👨‍💻 Author

Jeel-Khadasancha
Electronics / VLSI Enthusiast
