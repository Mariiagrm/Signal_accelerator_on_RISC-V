FROM IIC-OSIC-TOOLS

#Instalar el riscv-gnu-toolchain.
RUN apt-get update && apt-get install -y autoconf automake libmpc-dev libmpfr-dev libgmp-dev libexpat1-dev texinfo libtool patchutils bc zlib1g-dev

#Clonar el repositorio riscv-pk.
RUN git clone https://github.com/riscv-software-src/riscv-pk.git

RUN apt-get install -y device-tree-compiler
#Ejecutar el comando configure con el host deseado (ej. riscv64-unknown-elf) y luego make install
RUN cd riscv-pk && mkdir build && cd build && ../configure --host=riscv64-unknown-elf --with-arch=rv64imafdc --with-abi=lp64dcv --prefix=/opt/riscv && make -j$(nproc) && make install


#Configuración de Spike para Vectores
#Cuando ejecutas Spike, tienes que indicarle explícitamente que el hardware "virtual"
# tiene una unidad vectorial. El comando se vería algo así: spike --isa=rv64gcv mi_programa_vectorial

#Aquí es donde se pone interesante: puedes configurar el parámetro VLEN (el ancho de los registros vectoriales en bits). 
#Por ejemplo, si quieres simular un hardware con registros de 256 bits, usarías: 
#spike --isa=rv64gcv --varch=vlen:256,elen:64 pk mi_programa