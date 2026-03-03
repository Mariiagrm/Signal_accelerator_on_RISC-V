
#include <riscv_vector.h> 
#include <stdint.h>
//#include "operacionesVectoriales.h"

// 1. Enfoque Escalar (Tradicional)
// El procesador hace esto elemento por elemento.
void saxpy_scalar(size_t n, float a, const float *x, float *y) {
    for (size_t i = 0; i < n; i++) {
        y[i] = a * x[i] + y[i];
    }
}

// // 2. Enfoque Vectorial RVV (Vector Length Agnostic)
void saxpy_vec(size_t n, float a, const float *x, float *y) {

    size_t vl;

    for (; n > 0; n -= vl) {

        // Determinar longitud vectorial
        vl = __riscv_vsetvl_e32m8(n);

        // Cargar vectores
        vfloat32m8_t vx = __riscv_vle32_v_f32m8(x, vl);
        vfloat32m8_t vy = __riscv_vle32_v_f32m8(y, vl);

        // vy = a*vx + vy
        vy = __riscv_vfmacc_vf_f32m8(vy, a, vx, vl);

        // Guardar resultado
        __riscv_vse32_v_f32m8(y, vy, vl);

        // Avanzar punteros
        x += vl;
        y += vl;
    }
}

