# Usamos Ubuntu como base por su compatibilidad con las dependencias de RISC-V
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV RISCV=/opt/riscv
ENV PATH=$RISCV/bin:$PATH

# Instalar dependencias necesarias para compilar el toolchain y Spike
RUN apt-get update && apt-get install -y \
    autoconf automake autotools-dev curl python3 python3-pip \
    libmpc-dev libmpfr-dev libgmp-dev gawk build-essential \
    bison flex texinfo gperf libtool patchutils bc zlib1g-dev \
    libexpat-dev ninja-build git cmake libglib2.0-dev \
    device-tree-compiler && \
    wget software-properties-common gnupg \
    rm -rf /var/lib/apt/lists/*

RUN wget https://apt.llvm.org/llvm.sh  \
    chmod +x llvm.sh \
    ./llvm.sh 15

WORKDIR /src

# 1. Compilar RISC-V GNU Toolchain (RV64GCV + Multi-lib)
RUN git clone --recursive https://github.com/riscv/riscv-gnu-toolchain && \
    cd riscv-gnu-toolchain && \
    ./configure --prefix=$RISCV --with-arch=rv64gcv --with-abi=lp64d --enable-multilib && \
    make -j$(nproc) && \
    cd .. && rm -rf riscv-gnu-toolchain

# 2. Compilar RISC-V ISA Sim (Spike)
RUN git clone https://github.com/riscv-software-src/riscv-isa-sim.git && \
    cd riscv-isa-sim && \
    mkdir build && cd build && \
    ../configure --prefix=$RISCV && \
    make -j$(nproc) && \
    make install && \
    cd ../.. && rm -rf riscv-isa-sim

# 3. Compilar riscv-pk (Proxy Kernel - Necesario para ejecutar programas simples en Spike)
RUN git clone https://github.com/riscv-software-src/riscv-pk.git && \
    cd riscv-pk && \
    mkdir build && cd build && \
    ../configure --prefix=$RISCV --host=riscv64-unknown-elf && \
    make -j$(nproc) && \
    make install && \
    cd ../.. && rm -rf riscv-pk

WORKDIR /app
CMD ["/bin/bash"]