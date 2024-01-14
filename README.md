## FPGA UART Bubble Sort

In this project, we implemented a simple UART protocol on the AX309 Xilinx Spartan-6 FPGA. The goal was to send a sequence of numbers to the FPGA using this UART protocol. Upon reception, the FPGA employs a Bubble Sort algorithm to sort the numbers, returning the sorted array to the connected PC. The development environment used for programming the FPGA was Xilinx ISE.

### Code Overview

1. **Bubble Sort Algorithm (`bubblesort.vhdl`):**
   - VHDL implementation of the Bubble Sort algorithm designed for sorting an array of numbers.
   - **Input:**
     - Clock signal (`clk`)
     - Reset signal (`reset`)
     - Input array (`in_array`)
   - **Output:**
     - Sorted array (`sorted_array`)
   - The sorting process is triggered by the rising edge of the clock signal.

2. **UART Implementation (`uart.vhdl`):**
   - VHDL code implementing a UART module with generic parameters for divisor configuration.
   - **Input:**
     - Clock signal (`clk`)
     - Reset signal (`reset`)
     - Transmit data (`txdata`)
     - Write signal (`wr`)
     - Read signal (`rd`)
   - **Output:**
     - Received data (`rxdata`)
     - Flags for transmission availability (`tx_avail`), transmission busy (`tx_busy`), received data availability (`rx_avail`), received data full (`rx_full`), and reception error (`rx_error`).
   - The UART module is designed to handle both transmitting and receiving data.

3. **UART Receiver (`uart_rx.vhdl`):**
   - VHDL code for the UART receiver, which includes synchronization logic and error checking.
   - **Input:**
     - Clock signal (`clk`)
     - Reset signal (`reset`)
     - Input data (`rxd`)
     - Clear signal (`clear`)
   - **Output:**
     - Received data (`dout`)
     - Flags for data availability (`avail`) and error (`error`).

4. **UART Transmitter (`uart_tx.vhdl`):**
   - VHDL code for the UART transmitter, which handles data transmission with start and stop bits.
   - **Input:**
     - Clock signal (`clk`)
     - Reset signal (`reset`)
     - Transmit data (`din`)
     - Write signal (`wr`)
   - **Output:**
     - Transmission busy flag (`busy`)
     - Transmit data line (`txd`).

### How to Use

1. Program the FPGA using Xilinx ISE with the provided VHDL files.
2. Connect the FPGA to a PC through the UART interface.
3. Send a sequence of numbers from the PC to the FPGA using the implemented UART protocol.
4. Receive the sorted array back from the FPGA.
