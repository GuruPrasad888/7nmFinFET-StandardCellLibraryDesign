# 7nm Arithmetic Logic Unit (ALU) Design Project

## Overview

This project involves the design, simulation, synthesis, and physical verification of a custom 3-bit Arithmetic Logic Unit (ALU) using a 7nm technology node. The ALU supports basic arithmetic operations (addition and subtraction) based on a control signal and integrates a custom library of 34 standard cells developed at the same technology node.

---

## Features

- **Operands**: 3-bit inputs `A` and `B`
- **Reset**: Active-low `reset_n`
- **Select Line**: 1-bit `select` signal  
  - `0`: Performs unsigned addition  
  - `1`: Performs subtraction using two’s complement
- **Output**: 3-bit result on `F`

---

## Design Components

### RTL Design
- Implemented in Verilog HDL
- Testbench created for functional verification

### Standard Cell Library
Includes custom layouts and simulations for:
- INV, NAND2, NOR2, XOR2  
- AOI21, AOI22, OAI21, OAI22  
- MUX2:1  
- D Flip-Flop (negative edge-triggered, active-high reset)

Each standard cell includes:
- Schematic and layout
- DRC and LVS check
- PEX extraction and HSPICE simulation
- Liberty file generation

### ALU Synthesis and Simulation
- Synthesized netlist created using the standard cells
- Functional and post-layout simulations done using HSPICE
- Accurate matching observed between HDL and transistor-level simulation results

---

## Physical Design

### Place and Route
- 34 custom standard cells placed and routed manually
- Final layout passes all verification steps

### Verification
- **DRC**: Passed
- **LVS**: Passed
- **PEX**: Used for parasitic extraction and HSPICE simulation

---

## Files Included

- Verilog source files (`ALU.v`, `tb_ALU.v`)
- Synthesized netlist
- HSPICE simulation scripts
- Layout and schematic screenshots
- Standard cell layout and simulation details
- Verification reports (DRC, LVS, PEX)
- Block diagrams and waveform images

---

## Conclusion

This project demonstrates the complete design flow of a digital circuit from HDL to GDSII at the 7nm node. It includes RTL development, standard cell creation, synthesis, place and route, and full physical verification, providing end-to-end experience in custom digital IC design.
