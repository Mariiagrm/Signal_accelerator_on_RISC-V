#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "operacionesVectoriales.h"

int main() {
    // Código de prueba simple...
    const size_t N = 1000;
    float a = 2.0f;
    float *x = (float*)malloc(N * sizeof(float));
    float *y = (float*)malloc(N * sizeof(float));

    // Inicialización (omitiva para brevedad)
    for (size_t i = 0; i < N; i++) {
        x[i] = (float)i; // x = [0.0, 1.0, 2.0, ..., 999.0]
        y[i] = 1.0f;     // y = [1.0, 1.0, ..., 1.0]
    }
    clock_t start = clock();
    saxpy_scalar(N, a, x, y); // Llenamos 'y' con resultados iniciales
    clock_t end = clock();
    double time_scalar = (double)(end - start) / CLOCKS_PER_SEC;
    printf("Tiempo Escalar: %f segundos\n", time_scalar);

    
    printf("¡Cálculo completado!\n");
    
    free(x); free(y);
    return 0;
}