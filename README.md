# Signal_accelerator_on_RISC-V
To design and evaluate a signal processing accelerator using the RISC-V Vector Extension ( RVV ), analyzing the impact on performance and execution efficiency compared to traditional scalar implementations


- Architectural Analysis: Study the specification of the RISC-V vector extension (v1.0) and its VLA (Vector Length Agnostic) programming model to understand dynamic register management
- DSP Kernel Development: Implement fundamental signal processing algorithms (such as an FIR filter or an FFT ) using the C language and optimize them using vector intrinsics or RVV assembler.Validation and Simulation:
- Verify the functionality of the accelerator using reference simulators (such as Spike or QEMU ) and trace analysis tools to ensure the integrity of the processed data.
- Performance Evaluation: Compare key metrics such as instruction count, clock cycles, and throttle factor ($Speedup = \frac{T_{escalar}}{T_{vectorial}}$ ) varying the $VLEN$).
