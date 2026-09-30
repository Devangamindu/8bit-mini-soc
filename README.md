# 8-bit Verilog Mini SoC with Memory-Mapped Peripherals

## Overview

Designed and verified an 8-bit Mini System-on-Chip (SoC) in Verilog HDL integrating a custom CPU core with memory-mapped peripherals.

The system uses an address decoder and system bus to connect the CPU to Data RAM, GPIO, UART, and a priority-based interrupt controller.

## Architecture

CPU
 |
System Bus
 |
Address Decoder
 |
 +-- Data RAM
 +-- GPIO
 +-- UART
 +-- Interrupt Controller

## Memory Map

| Address | Peripheral |
|---------|------------|
| 0x00–0x7F | Data RAM |
| 0x80 | GPIO |
| 0x90 | UART |
| 0xA0 | Interrupt Controller |

## CPU Features

- 8-bit datapath
- ALU
- Register file
- Program counter
- Instruction register
- Control FSM
- Instruction memory
- Data memory interface

## Instruction Set

- NOP
- LOAD
- ADD
- SUB
- AND
- OR
- XOR
- LOAD_MEM
- STORE
- JMP
- BEQ
- HALT

## Peripherals

### GPIO
Memory-mapped 8-bit GPIO register.

### UART
Integrated UART transmitter and receiver with TX/RX loopback verification.

### Interrupt Controller
Implemented a 4-source level-triggered interrupt controller with:

- Priority-based interrupt selection
- Pending interrupt storage
- CPU acknowledgement
- Interrupt ID generation
- Level-triggered behavior

Priority:

IRQ3 > IRQ2 > IRQ1 > IRQ0

## Verification

Verified using Xilinx Vivado simulation:

- CPU instruction execution
- RAM read/write
- GPIO access
- UART access
- Interrupt read/write path
- Interrupt acknowledgement
- Level-triggered behavior
- Interrupt priority
- Full peripheral integration

## Tools

- Verilog HDL
- Xilinx Vivado
- Vivado Simulator
