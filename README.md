# Signal_accelerator_on_RISC-V
To design and evaluate a signal processing accelerator using the RISC-V Vector Extension ( RVV ), analyzing the impact on performance and execution efficiency compared to traditional scalar implementations


- Architectural Analysis: Study the specification of the RISC-V vector extension (v1.0) and its VLA (Vector Length Agnostic) programming model to understand dynamic register management
- DSP Kernel Development: Implement fundamental signal processing algorithms (such as an FIR filter or an FFT ) using the C language and optimize them using vector intrinsics or RVV assembler.Validation and Simulation:
- Verify the functionality of the accelerator using reference simulators (such as Spike or QEMU ) and trace analysis tools to ensure the integrity of the processed data.
- Performance Evaluation: Compare key metrics such as instruction count, clock cycles, and throttle factor ($Speedup = \frac{T_{escalar}}{T_{vectorial}}$ ) varying the $VLEN$).


# Environtment

## Dependencies
- autoconf: A tool for generating configuration scripts for software packages.
- automake: A tool for automatically generating Makefile.in files from Makefile.am files.
- autotools-dev: Development files for the GNU Autotools.
- curl: A command-line tool for transferring data with URLs, useful for downloading files.
- python3: The Python programming language version 3, often used for scripting and automation.
- python3-pip: A package manager for Python 3, allowing the installation of Python packages.
- libmpc-dev: A library for complex number computations, often used in mathematical software.
- libmpfr-dev: A library for multiple-precision floating-point computations with correct rounding.
- libgmp-dev: The GNU Multiple Precision Arithmetic Library, used for high-precision arithmetic.
- gawk: A programming language for pattern scanning and processing, often used in data manipulation.
- build-essential: A package that includes essential tools for building software, such as GCC and make.
- bison: A parser generator that is compatible with Yacc, used for generating parsers.
- flex: A tool for generating scanners, which recognize patterns in text.
- texinfo: A documentation system that uses a single source file to produce both online and printed documentation.
- gperf: A perfect hash function generator, useful for creating efficient hash tables.
- libtool: A generic library support script that abstracts the complexity of using shared libraries.
- patchutils: A collection of tools for manipulating patch files.
- bc: An arbitrary precision calculator language.
- zlib1g-dev: A compression library that provides functions for data compression.
- libexpat-dev: A library for parsing XML documents.
- ninja-build: A small build system with a focus on speed.
- git: A version control system for tracking changes in source code.
- cmake: A cross-platform build system generator.
- libglib2.0-dev: A low-level core library that forms the basis for projects such as GTK and GStreamer.
- device-tree-compiler: A tool for compiling and decompiling device tree source files.

## Repositories

1. RISC-V GNU Toolchain (RV64GCV + Multi-lib): The RISC-V GNU Toolchain is a collection of open-source programming tools (compiler, assembler, linker, debugger) used to develop C and C++ software for the RISC-V ISA. It operates as a cross-compiler, allowing developers to build RISC-V applications on non-RISC-V systems (like x86 Linux or macOS). It supports both bare-metal (ELF/Newlib) and Linux-based (glibc) environments. 


2. RISC-V ISA Sim (Spike): Reference functional RISC-V ISA C++ software simulator that models a RISC-V hart and its cache system, allowing developers to test code, simulate custom extensions, and debug applications without needing physical hardware. It supports 32-bit and 64-bit ISA variations, including privileged modes (Machine, Supervisor, User), making it a fundamental tool for RISC-V software development and validation

3. Riscv-pk (Proxy Kernel): The proxy kernel is a critical tool in the RISC-V software ecosystem for developers who need to run code before an OS is fully functional. 

